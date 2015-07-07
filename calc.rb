class Calculator
  attr_accessor :x, :y

  def initialize(x,y)
    @x, @y = x, y
  end
  
  def self.description
    "Performs basic mathematical operations"
  end

  operations = {:+ => :add, :- =>  :subtract, :* => :multiply, :/ => :divide}
  operations.each do |k,v|
    define_method(v) do
      k == :/ ? @x.send(k, @y.to_f) : @x.send(k, @y)
    end
  end
  
end 