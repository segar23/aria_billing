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
end
