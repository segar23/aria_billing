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

  describe "self.get_acct_status_history(params)",:vcr do 
    it "Returns the history of modifications to an account's status" do
      response = api.get_acct_status_history ({ "account_number" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("stat_hist")
    end
  end

  describe "self.get_acct_supp_plan_history(params)",:vcr do 
    it "Returns a list of current and previous supplemental plans assigned to an account" do
      response = api.get_acct_supp_plan_history ({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("supp_plan_hist")
    end
  end

  describe "self.get_statement_content(params)",:vcr do 
    it "Returns the contents of a particular statement associated with a specified account" do
      response = api.get_statement_content ({ "acct_no" => 1, "statement_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("statement_content")
      response.should have_key("mime_type")
    end
  end

  describe "self.get_statement_content_size(params)",:vcr do 
    it "Returns the number of characters in a particular statement associated with a specified account" do
      response = api.get_statement_content_size ({ "acct_no" => 1, "statement_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("num_chars")
    end
  end

  describe "self.get_statement_for_inv_size(params)",:vcr do 
    it "Returns the number of characters in a statement associated with a specified account and invoice" do
      response = api.get_statement_for_inv_size ({ "acct_no" => 1, "invoice_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("num_chars")
    end
  end

  describe "self.get_statement_for_invoice(params)",:vcr do 
    it "Returns a statement associated with a specified account and invoice" do
      response = api.get_statement_for_invoice ({ "acct_no" => 1, "invoice_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("out_statement")
      response.should have_key("mime_type")
    end
  end
end