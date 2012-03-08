require 'spec_helper'

describe AriaBilling::Configuration do

  describe "self.auth_key" do
    it "raises an exception if it hasn't been set yet" do
      AriaBilling::Configuration.instance_variable_set(:@auth_key, nil)

      expect {
        AriaBilling::Configuration.auth_key
      }.to raise_error(AriaBilling::ConfigurationError, "AriaBilling::Configuration.auth_key needs to be set")
    end
  end

  describe "self.client_no" do
    it "raises an exception if it hasn't been set yet" do
      AriaBilling::Configuration.instance_variable_set(:@client_no, nil)

      expect {
        AriaBilling::Configuration.client_no
      }.to raise_error(AriaBilling::ConfigurationError, "AriaBilling::Configuration.client_no needs to be set")
    end
  end


  describe "self.url" do
    it "raises an exception if it hasn't been set yet" do
      AriaBilling::Configuration.instance_variable_set(:@url, nil)

      expect {
        AriaBilling::Configuration.url
      }.to raise_error(AriaBilling::ConfigurationError, "AriaBilling::Configuration.url needs to be set")
    end
  end

  describe "self.credentials" do
    it "returns a hash of :auth_key and :auth_key" do
      AriaBilling::Configuration.auth_key = "1234"
      AriaBilling::Configuration.client_no = "5678"
      AriaBilling::Configuration.credentials.should == { auth_key: "1234", client_no: "5678" }
    end
  end

end