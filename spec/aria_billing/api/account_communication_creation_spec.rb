require 'spec_helper'

describe "Account Communication Creation" do

  def api
    AriaBilling
  end

  describe "self.gen_statement(params)",:vcr do
    it "Generates a statement based on an invoice that has not been inluded in a statement" do
      response = api.gen_statement({"acct_no" => 1})

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("statement_no")
    end
  end

  describe "self.send_acct_email(params)",:vcr do
    it "Sends a specified message type to a particular account holder identified by a user ID" do
      response = api.send_acct_email({"user_id" => 'PSLcorp'})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.send_arc_threshold_email(params)",:vcr do
    it "Send account holder email message using client's configured template for class 'Z'" do
      params = { "acct_no" => 1, "resource_threshold_level" => 1, "resource_balance" => 1}
      response = api.send_arc_threshold_email params

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.write_acct_comment(params)",:vcr do
    it "Adds comments to a specified account record" do
      params = { "acct_no" => 1, "comment" => 'Hello'}
      response = api.write_acct_comment params

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end
end