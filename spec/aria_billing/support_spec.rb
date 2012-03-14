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

      response.inspect.should include("\"country_cd\"=>\"CA\"")
      response.inspect.should include("\"country_native\"=>\"Canada\"")
      response.inspect.should include("\"country_english\"=>\"Canada\"")
      response.inspect.should include("\"iso_3166_1n\"=>\"124\"")
      response.inspect.should include("\"currency_cd\"=>\"cad\"")

      response.inspect.should include("\"country_cd\"=>\"US\"")
      response.inspect.should include("\"country_native\"=>\"United States\"")
      response.inspect.should include("\"country_english\"=>\"United States\"")
      response.inspect.should include("\"iso_3166_1n\"=>\"840\"")
      response.inspect.should include("\"currency_cd\"=>\"usd\"")
      
    end
  end
end