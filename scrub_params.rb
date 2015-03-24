
class Hash
  def scrub(filter)
    params = self.class.new
    params.merge!(self)
    filter = filter.map {|p| p.map {|e| e.is_a?(Symbol) ? e.to_s : e }}
    params = params.map {|p| p.map {|e| e.is_a?(Symbol) ? e.to_s : e }}
    binding.pry
    pathify_collections(filter, params).each do |path|
      action = path.pop
      value = get_by_keys(params, path)
      if value
        set_by_keys(params, path, value.send(action))
      end
    end

    params
  end

  def get_by_keys(hash, keys)
    keys.inject(hash) { |h, k| h.public_send(:[], k) }
  end

  def set_by_keys(hash, keys, v)
    last = keys[0..-2].inject(hash) { |h, k| h.public_send(:[], k) }
    last.public_send(:[]=, keys[-1], v)
    hash
  end

  def pathify_keys(hsh)
    hsh.inject([]) do |mem,(key, value)|
      if value.is_a?(Hash)
        pathify_keys(value).each { |arr| mem << ([key] + arr) }
      else
        mem << [key]
      end
      mem
    end
  end

  def pathify_collections(filter, source)
    pathified_filter = pathify_keys(filter)
    pathified_source = pathify_keys(source)

    pathified_filter = pathified_filter.each {|p| p << get_by_keys(filter, p)}
    #pathified_filter = pathified_filter.map {|p| p.map {|e| e.is_a?(Symbol) ? e.to_s : e }}
    includes_enum = ->(i){ i.include?(Enumerable)}
      pathified_filter.each do |filter_path|
        if filter_path.include?(Enumerable)
          expanded_paths = pathified_source.select { |source_path|
            source_path << filter_path.last
            source_path.each_with_index.inject(true) { |memo, (element, index)| 
              memo = false unless filter_path[index] == element || filter_path[index] == Enumerable
              memo
            }
          }
          pathified_filter.delete(filter_path)
          pathified_filter += expanded_paths
        end
      end
    pathified_filter.delete_if { |p| p.include?(Enumerable) }
    pathified_filter
  end

end

class String
  def blank?
    self.length == 0
  end


  def empty_to_nil
    self.empty? ? nil : self
  end

  def to_i_or_nil
    is_i? ? self.to_i : nil
  end

  def is_i?
    /\A[-+]?\d+\z/ === self
  end

  def to_bool
    return true   if self == true   || self =~ (/(true|t|yes|y|1)$/i)
    return false  if self == false  || self.blank? || self =~ (/(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end

  def only_digits
    self.gsub(/\D/, "")
  end
end

class Array
  def only_non_empty
    self.select do |e|
      if e.respond_to?(:empty?) 
        !e.empty?
      else
        true
      end
    end
  end
end