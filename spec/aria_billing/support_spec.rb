require 'spec_helper'

describe AriaBilling::Support do
  describe "self.get_country_from_ip(params)", :vcr do
    it "returns the country code and name of a given IP" do
      response = AriaBilling::Support.get_country_from_ip("ip_address" => "64.71.167.222")
      response["country_code"].should == "US"
      response["country_name"].should == "United States"
      response.code.should == 200
    end

    it "returns errors" do
      response = AriaBilling::Support.get_country_from_ip("ip_address" => "1.1.1")
      response["country_code"].should be_nil
      response["country_name"].should be_nil
      response["error_msg"].should == "no data found"
    end
  end

  describe "self.gen_random_string(params)",:vcr do
    it "generates a random string" do 
      response= AriaBilling::Support.gen_random_string({"rand_type" => 'A',
                                                        "rand_length" => 5,
                                                        "rand_case" => 'U'})
      response["random_string"].should_not be_nil
      response["random_string"].should have(5).caracters
      response["random_string"].should match(/^[^a-z]*$/)
      response.code.should == 200
    end

    it "returns errors" do 
       response= AriaBilling::Support.gen_random_string({"rand_type" => 'K',
                                                        "rand_length" => 5,
                                                        "rand_case" => 'P'})
       response["random_string"].should be_nil
       response["error_msg"].should == "invalid input"
    end  
  end

  describe "self.get_client_countries(params)",:vcr do
    it "return a list of countries assigned to a client" do
      response = AriaBilling::Support.get_client_countries({})

      response["client_country"][0]["country_cd"].should == "CA"
      response["client_country"][0]["country_native"].should == "Canada"
      response["client_country"][0]["country_english"].should == "Canada"
      response["client_country"][0]["iso_3166_1n"].should == "124"
      response["client_country"][0]["currency_cd"].should == "cad"

      response["client_country"][1]["country_cd"].should == "US"
      response["client_country"][1]["country_native"].should == "United States"
      response["client_country"][1]["country_english"].should == "United States"
      response["client_country"][1]["iso_3166_1n"].should == "840"
      response["client_country"][1]["currency_cd"].should == "usd"

      response.code.should == 200      
    end
    #TODO: returns errors change:auth_key and client_no
  end

  describe "self.userid_exists(params)",:vcr do
    it "Determines whether a specified user ID is already in use" do
      response=AriaBilling::Support.userid_exists({"user_id" => 'PSLcorp'})

      response["error_msg"].should == "account does not exist"
      response["error_code"].should == 1009

      response.code.should == 200
    end
    #TODO:returns existing account
  end

  describe "self.userid_is_available(params)",:vcr do
    it "Determines whether a specified user ID is avalible for use" do
      response=AriaBilling::Support.userid_is_available({"user_id" => 'PSLcorp'})

      response["error_msg"].should == "OK"
      response["error_code"].should == 0

      response.code.should == 200
    end
    #TODO: returns user id is taken error_code:5011.
  end

  describe "self.validate_session(params)",:vcr do
    #TODO:return a valid session ID.
    # it "Determines the validity of a specified session and the user with session ID" do
    # end
    it "return invalid session" do
      response=AriaBilling::Support.validate_session({"session_id" => '123456'})

      response["user_id"].should be_nil
      response["account_no"].should be_nil
      response["error_msg"].should == "invalid session"
    end
  end

  describe "self.get_web_replacement_vals(params)",:vcr do
    it "get an array of values for an array of input web replacement strings" do 
      response=AriaBilling::Support.get_web_replacement_vals({"in_replacement_names[0]" => "One|Two"})

      response["web_vals_out"][0]["out_replacement_names"].should == "One"
      response["web_vals_out"][0]["out_replacement_values"].should == ""

      response["web_vals_out"][1]["out_replacement_names"].should == "Two"
      response["web_vals_out"][1]["out_replacement_values"].should == ""

      response.code.should == 200
  end
end

end