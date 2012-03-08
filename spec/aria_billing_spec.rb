require 'spec_helper'

describe AriaBilling do
  describe "self.make_request(params)" do
    it "makes a post to the configuration URL with the credentails and params in the body" do
      AriaBilling.should_receive(:post).
        with("url", body: { auth_key: "auth_key", client_no: "client_no", message: "hello", user: "tony"}).
          and_return("response")

      AriaBilling.make_request(message: "hello", user: "tony")
    end
  end
end