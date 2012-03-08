require 'spec_helper'

describe AriaBilling do
  describe "self.make_request(params)" do
    it "makes a post to the configuration URL with the credentails and params in the body" do
      aria.should_receive(:post).
        with("url", body: { auth_key: "auth_key", client_no: "client_no", message: "hello", user: "tony", output_format: "json" }).
          and_return("response")

      aria.make_request(message: "hello", user: "tony")
    end

    it "responds with json by default" do
      aria.should_receive(:post).
        with("url", body: { auth_key: "auth_key", client_no: "client_no", output_format: "json" }).
          and_return("response")

      aria.make_request
    end

    it "rewrites params passed as opts" do
      aria.should_receive(:post).
        with("url", body: { auth_key: "the-special-key", output_format: "xml", client_no: "client_no" }).
          and_return("response")

      aria.make_request(auth_key: "the-special-key", output_format: "xml")
    end

    def aria
      AriaBilling
    end
  end
end