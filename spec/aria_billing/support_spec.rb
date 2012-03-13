require 'spec_helper'

describe AriaBilling::Support do
  describe "self.get_country_from_ip(params)", :vcr do
    it "returns the Country of a given API" do
      response = AriaBilling::Support.get_country_from_ip("ip_address" => "64.71.167.222")
      response["country_code"].should == "US"
      response["country_name"].should == "United States"
      response.code.should == 200
    end
  end
end
