require 'spec_helper'

describe AriaBilling::Support do

  describe "self.get_country_from_ip(params)" do

    it "returns the Country of a given API" do
      # AriaBilling::Configuration.auth_key = "8Vn848nuRPa58jht9jBBpWvSUVsn3fnB"
      # AriaBilling::Configuration.client_no = "4950701"
      # AriaBilling::Configuration.url = "https://secure.future.stage.ariasystems.net/api/ws/api_ws_class_dispatcher.php"
      #
      # response = AriaBilling::Support.get_country_from_ip("ip_address" => "190.250.125.18")
      # puts response.body
      # response["country_code"].should == "CO"
      # response["country_name"].should == "Colombia"
      # response.code.should == 200
    end
  end

end