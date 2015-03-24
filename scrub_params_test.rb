# File:  tc_simple_number.rb
 
require './scrub_params'
require 'minitest/autorun'

 
class TestParameters < Minitest::Test

 def setup
    @contact_unclean = {:voter_id=>"",
     :civi_id=>"",
     :district_id=>1,
     :poll_id=>"",
     :seq_id=>nil,
     :elector_status=>nil,
     :voting_status=>nil,
     :first_name=>"Sterling",
     :middle_name=>nil,
     :last_name=>"Archer",
     :notes=>{'1' => {commenters: {'bob' => "Bud", 'dick' => "wei", 'harry' => "ser"}, body: "Text"}, '2' => {commenters: {'bob' => "Bud", 'dick' => "wei", 'harry' => "ser"}, body: "Text"}, '3' => {}, '4' => {}},
     :primary_email=>{"label"=>nil, "address"=>"sterling@isis.org"},
     :other_emails=>[],
     :primary_phone=>{"number"=>"4444444444", "label"=>nil, "textable"=>"0"},
     :other_phones=>[{"number"=>"3333333333", "label"=>nil, "textable"=>"0"}],
     :primary_address=>
      {"unit_num"=>nil,
       "bldg_num"=>"5",
       "street_name"=>"Albert",
       "street_type"=>"St",
       "street_dir"=>nil,
       "town"=>"Ottawa",
       "mail_prov"=>"ON",
       "postal_code"=>"K1K 1K1",
       "bldg_num_sfx"=>nil,
       "rural_addr_type"=>nil,
       "rural_section"=>nil,
       "rural_township"=>nil,
       "rural_range"=>nil,
       "rural_meridian"=>nil,
       "rural_lot"=>nil,
       "rural_concession"=>nil,
       "rural_physical_addr"=>nil,
       "mail_flag"=>nil,
       "mail_addr1"=>nil,
       "mail_addr2"=>nil,
       "mail_place"=>nil,
       "mail_postal_code"=>nil},
     :other_addresses=>[],
     :do_not_email=>false,
     :do_not_phone=>false,
     :do_not_mail=>false,
     :tag_ids=>["c3a5c2b343c2b5c2a3c2a9c399000f82", "6f30c3a764c2a64c69c3962236001038", "4ec39fc28fc2b914c3b34fc3a400162d"],
     :created_at=>1425322674,
     :updated_at=>1426269496}


    @contact_result = {:voter_id=>"",
     :civi_id=>nil,
     :district_id=>1,
     :poll_id=>nil,
     :seq_id=>nil,
     :elector_status=>nil,
     :voting_status=>nil,
     :first_name=>"Sterling",
     :middle_name=>nil,
     :last_name=>"Archer",
     :notes=>{'1' => {commenters: {'bob' => "Bud", 'dick' => "wei", 'harry' => "ser"}, body: "Text"}, '2' => {commenters: {'bob' => "Bud", 'dick' => "wei", 'harry' => "ser"}, body: "Text"}, '3' => {}, '4' => {}},
     :primary_email=>{"label"=>nil, "address"=>"sterling@isis.org"},
     :other_emails=>[],
     :primary_phone=>{"number"=>"4444444444", "label"=>nil, "textable"=>"0"},
     :other_phones=>[{"number"=>"3333333333", "label"=>nil, "textable"=>"0"}],
     :primary_address=>
      {"unit_num"=>nil,
       "bldg_num"=>"5",
       "street_name"=>"Albert",
       "street_type"=>"St",
       "street_dir"=>nil,
       "town"=>"Ottawa",
       "mail_prov"=>"ON",
       "postal_code"=>"K1K 1K1",
       "bldg_num_sfx"=>nil,
       "rural_addr_type"=>nil,
       "rural_section"=>nil,
       "rural_township"=>nil,
       "rural_range"=>nil,
       "rural_meridian"=>nil,
       "rural_lot"=>nil,
       "rural_concession"=>nil,
       "rural_physical_addr"=>nil,
       "mail_flag"=>nil,
       "mail_addr1"=>nil,
       "mail_addr2"=>nil,
       "mail_place"=>nil,
       "mail_postal_code"=>nil},
     :other_addresses=>[],
     :do_not_email=>false,
     :do_not_phone=>false,
     :do_not_mail=>false,
     :tag_ids=>["c3a5c2b343c2b5c2a3c2a9c399000f82", "6f30c3a764c2a64c69c3962236001038", "4ec39fc28fc2b914c3b34fc3a400162d"],
     :created_at=>1425322674,
     :updated_at=>1426269496}

    @contact_filter = { notes: {Enumerable => {commenters: {Enumerable => :empty_to_nil}}}, poll_id: :empty_to_nil, civi_id: :empty_to_nil }

    @user_unclean = {:email=>"admin@example.com",
                     :phone=>nil,
                     :first_name=>"Elizabeth",
                     :last_name=>"",
                     :phone_number=>"",
                     :region_roles=>{"global"=>"admin", "5ac29fc2b0c2a8c381c380c2a6003908"=>nil, "5ac29fc2b0c2a8c381c380c2a600447a"=>nil},
                     :current_region_id=>"5ac29fc2b0c2a8c381c380c2a6003908",
                     :recent_contact_ids=>["58c39878c284c2bcc2b5384422001793", "0920c287c28330320475c3aac20001b4"],
                     :password_digest=>"$2a$10$hvYPFmgGwrYolMmj1OayX.cJpekKH2qfh9iT94hXlGjRIGnGdxJ.u",
                     :activation_digest=>"$2a$10$VViZ.ZurZH5OJVBftn8szeq0bCAgPg6Ne05AD7jNfspTba6Fwjqfu",
                     :activated=>true,
                     :activated_at=>nil,
                     :reset_digest=>nil,
                     :reset_sent_at=>nil,
                     :provider=>nil,
                     :uid=>nil,
                     :oauth_token=>nil,
                     :oauth_expires_at=>nil,
                     :sign_in_count=>1,
                     :last_sign_in_at=>1424893606,
                     :last_sign_in_ip=>"::1",
                     :accepted_terms_of_service=>true,
                     :created_at=>1424893254,
                     :updated_at=>1425323810}

    @user_filter = {
                      first_name: :empty_to_nil,
                      last_name: :empty_to_nil,
                      email: :empty_to_nil,
                      phone_number: :empty_to_nil,
                      current_region_id: :empty_to_nil,
                      region_roles: { Enumerable => :empty_to_nil },
                      phones_attributes: { Enumerable => {
                        label: :empty_to_nil
                      }}
                    }

    @user_result = {:email=>"admin@example.com",
                     :phone=>nil,
                     :first_name=>"Elizabeth",
                     :last_name=>nil,
                     :phone_number=>nil,
                     :region_roles=>{"global"=>"admin", "5ac29fc2b0c2a8c381c380c2a6003908"=>nil, "5ac29fc2b0c2a8c381c380c2a600447a"=>nil},
                     :current_region_id=>"5ac29fc2b0c2a8c381c380c2a6003908",
                     :recent_contact_ids=>["58c39878c284c2bcc2b5384422001793", "0920c287c28330320475c3aac20001b4"],
                     :password_digest=>"$2a$10$hvYPFmgGwrYolMmj1OayX.cJpekKH2qfh9iT94hXlGjRIGnGdxJ.u",
                     :activation_digest=>"$2a$10$VViZ.ZurZH5OJVBftn8szeq0bCAgPg6Ne05AD7jNfspTba6Fwjqfu",
                     :activated=>true,
                     :activated_at=>nil,
                     :reset_digest=>nil,
                     :reset_sent_at=>nil,
                     :provider=>nil,
                     :uid=>nil,
                     :oauth_token=>nil,
                     :oauth_expires_at=>nil,
                     :sign_in_count=>1,
                     :last_sign_in_at=>1424893606,
                     :last_sign_in_ip=>"::1",
                     :accepted_terms_of_service=>true,
                     :created_at=>1424893254,
                     :updated_at=>1425323810}

    @user_filter_pathified = [[:first_name, :empty_to_nil], 
                              [:last_name, :empty_to_nil], 
                              [:email, :empty_to_nil], 
                              [:phone_number, :empty_to_nil], 
                              [:current_region_id, :empty_to_nil], 
                              [:region_roles, 'global', :empty_to_nil], 
                              [:region_roles, "5ac29fc2b0c2a8c381c380c2a6003908", :empty_to_nil], 
                              [:region_roles, "5ac29fc2b0c2a8c381c380c2a600447a", :empty_to_nil]]

    @contact_unclean2 =  {"_searched_for_duplicates"=>"1",
                         "first_name"=>"Cinnamon",
                         "middle_name"=>"Dawn",
                         "last_name"=>"Lennox",
                         "language_pref"=>"en",
                         "do_not_email"=>"0",
                         "do_not_phone"=>"0",
                         "do_not_mail"=>"0",
                         "phones_attributes"=>{"0"=>{"number"=>"5555555555", "textable"=>"0", "_primary"=>"1", "_destroy"=>""}},
                         "addresses_attributes"=>
                          {"0"=>
                            {"unit_num"=>"",
                             "bldg_num"=>"525",
                             "street_name"=>"Bowlsby",
                             "street_type"=>"Pl",
                             "street_dir"=>"",
                             "town"=>"Victoria",
                             "mail_prov"=>"BC",
                             "postal_code"=>"V9A 4C6",
                             "bldg_num_sfx"=>"",
                             "rural_addr_type"=>"",
                             "rural_section"=>"",
                             "rural_township"=>"",
                             "rural_range"=>"",
                             "rural_meridian"=>"",
                             "rural_lot"=>"",
                             "rural_concession"=>"",
                             "rural_physical_addr"=>"",
                             "mail_flag"=>"",
                             "mail_addr1"=>"525 Bowlsby Pl",
                             "mail_addr2"=>"",
                             "mail_place"=>"Victoria",
                             "mail_postal_code"=>"V9A 4C6",
                             "_primary"=>"1",
                             "_destroy"=>""}},
                         "district_id"=>"642"}

    @contact_filter2 = {
                        first_name: :empty_to_nil, 
                        middle_name: :empty_to_nil, 
                        last_name: :empty_to_nil, 
                        district_id: :to_i_or_nil,
                        language_pref: :to_sym,
                        do_not_email: :to_bool,
                        do_not_phone: :to_bool,
                        do_not_mail: :to_bool, 
                        phones_attributes: {Enumerable => {
                          number: :only_digits
                          }},
                        emails_attributes: {Enumerable => {
                          }},
                        addresses_attributes: {Enumerable => {
                          unit_num: :empty_to_nil,
                          bldg_num: :empty_to_nil,
                          street_name: :empty_to_nil,
                          street_type: :empty_to_nil,
                          street_dir: :empty_to_nil,
                          town: :empty_to_nil,
                          mail_prov: :empty_to_nil,
                          postal_code: :empty_to_nil,
                          bldg_num_sfx: :empty_to_nil,
                          rural_addr_type: :empty_to_nil,
                          rural_section: :empty_to_nil,
                          rural_township: :empty_to_nil,
                          rural_range: :empty_to_nil,
                          rural_meridian: :empty_to_nil,
                          rural_lot: :empty_to_nil,
                          rural_concession: :empty_to_nil,
                          rural_physical_addr: :empty_to_nil,
                          mail_flag: :empty_to_nil,
                          mail_addr1: :empty_to_nil,
                          mail_addr2: :empty_to_nil,
                          mail_place: :empty_to_nil,
                          mail_place_code: :empty_to_nil,
                          }},
                        }

      @contact_result2 = {
                           "_searched_for_duplicates"=>"1",
                           "first_name"=>"Cinnamon",
                           "middle_name"=>"Dawn",
                           "last_name"=>"Lennox",
                           "language_pref"=>"en",
                           "do_not_email"=> false,
                           "do_not_phone"=> false,
                           "do_not_mail"=> false,
                           "phones_attributes"=>{"0"=>{"number"=>"5555555555", "textable"=>"0", "_primary"=>"1", "_destroy"=>""}},
                           "addresses_attributes"=>
                            {"0"=>
                              {"unit_num"=>nil,
                               "bldg_num"=>"525",
                               "street_name"=>"Bowlsby",
                               "street_type"=>"Pl",
                               "street_dir"=>nil,
                               "town"=>"Victoria",
                               "mail_prov"=>"BC",
                               "postal_code"=>"V9A 4C6",
                               "bldg_num_sfx"=>nil,
                               "rural_addr_type"=>nil,
                               "rural_section"=>nil,
                               "rural_township"=>nil,
                               "rural_range"=>nil,
                               "rural_meridian"=>nil,
                               "rural_lot"=>nil,
                               "rural_concession"=>nil,
                               "rural_physical_addr"=>nil,
                               "mail_flag"=>nil,
                               "mail_addr1"=>"525 Bowlsby Pl",
                               "mail_addr2"=>nil,
                               "mail_place"=>"Victoria",
                               "mail_postal_code"=>"V9A 4C6",
                               "_primary"=>"1",
                               "_destroy"=>""}},
                           "district_id"=>"642"
      }
  end

  def test_user_pathified
    assert_equal(@user_filter_pathified.sort, @user_filter.pathify_collections(@user_filter, @user_unclean).sort)
  end
 
  def test_type_is_hash
    assert @contact_unclean.class == Hash
  end
  
  def test_contact_scrub
    assert_equal(@contact_result, @contact_unclean.scrub(@contact_filter))
  end

  def test_user_scrub
    assert_equal(@user_result, @user_unclean.scrub(@user_filter))
  end

  def test_contact2_scrub
    assert_equal(@contact_result2, @contact_unclean2.scrub(@contact_filter2))
  end
end