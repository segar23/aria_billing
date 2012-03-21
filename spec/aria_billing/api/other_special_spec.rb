require 'spec_helper'

describe "Other-Special" do

  def api
    AriaBilling
  end

  describe "self.gen_random_string(params)",:vcr do
    it "generates a random string" do
      params = { "rand_type" => 'A', "rand_length" => 5, "rand_case" => 'U' }
      response = api.gen_random_string params

      response.should have_key("random_string")
      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end
end
