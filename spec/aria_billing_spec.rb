require 'spec_helper'

describe AriaBilling do
  before(:each) do
    AriaBilling::Configuration.auth_key = "auth_key"
    AriaBilling::Configuration.client_no = "client_no"
    AriaBilling::Configuration.url = "url"
  end

  describe "self.make_request(params)" do
    it "makes a post to the configuration URL with the credentails and params in the body" do
      expects_call auth_key: "auth_key", client_no: "client_no", message: "hello", user: "tony", output_format: "json"
      aria.make_request message: "hello", user: "tony"
    end

    it "responds with json by default" do
      expects_call auth_key: "auth_key", client_no: "client_no", output_format: "json"
      aria.make_request
    end

    it "rewrites params passed as opts" do
      expects_call auth_key: "the-special-key", output_format: "xml", client_no: "client_no"
      aria.make_request auth_key: "the-special-key", output_format: "xml"
    end

    def aria
      AriaBilling
    end

    def expects_call(params)
      aria.should_receive(:post).with("url", body: params).and_return("response")
    end
  end

  after(:all) do
    SupportSpecHelper.use_development_credentials
  end
end