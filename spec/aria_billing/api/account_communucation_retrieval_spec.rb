require 'spec_helper'

describe "Account Comunication Retrieval" do

  def api
    AriaBilling
  end

  describe "self.get_acct_invoice_history(params)",:vcr do 
    it "Returns the invoice history for a specified account" do
      response = api.get_acct_invoice_history ({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("invoice_history")
    end
  end

  describe "self.get_acct_message(params)",:vcr do 
    it "Returns the body of a particular email message sent to a specified account holder" do
      response = api.get_acct_message ({ "acct_no" => 1, "message_id" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("message_body")
      response.should have_key("mime_type")
    end
  end

  describe "self.get_acct_message_size(params)",:vcr do 
    it "Returns the size in bytes of the body of a particular email message sent to a specified account holder" do
      response = api.get_acct_message_size ({ "acct_no" => 1, "message_id" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("num_chars")
    end
  end

  describe "self.get_acct_statement_history(params)",:vcr do 
    it "Returns the list of all statements generated for a specified account" do
      response = api.get_acct_statement_history ({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("statement_history")
    end
  end
end