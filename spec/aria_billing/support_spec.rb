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
    end
  end
end