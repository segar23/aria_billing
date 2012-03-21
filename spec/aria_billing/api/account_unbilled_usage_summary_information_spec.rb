require 'spec_helper'

describe "Account Unbilled Usage Summary Information" do

  def api
    AriaBilling
  end

  describe "self.get_unbilled_usage_summary(params)",:vcr do
    it "Returns all information related to summary value of unbilled usage on the account" do
      response = api.get_unbilled_usage_summary({"acct_no" => 1})

      response.should have_key("error_code")
      response.should have_key("currency_cd")
      response.should have_key("currency_name")
      response.should have_key("acct_mtd_threshold_amount")
      response.should have_key("acct_ptd_threshold_amount")
      response.should have_key("client_mtd_threshold_amount")
      response.should have_key("client_ptd_threshold_amount")
      response.should have_key("mtd_balance_amount")
      response.should have_key("ptd_balance_amount")
      response.should have_key("acct_mtd_delta_sign")
      response.should have_key("acct_mtd_delta_amount")
      response.should have_key("acct_ptd_delta_sign")
      response.should have_key("acct_ptd_delta_amount")
      response.should have_key("client_mtd_delta_sign")
      response.should have_key("client_mtd_delta_amount")
      response.should have_key("client_ptd_delta_sign")
      response.should have_key("client_ptd_delta_amount")
      response.should have_key("error_msg")
    end
  end
      
  describe "self.reset_usg_mtd_bal(params)",:vcr do 
    it "Reset account's Mounth-To-date unbilled usage balance to zero" do
      response = api.reset_usg_mtd_bal({"acct_no" => 1})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.reset_usg_ptd_bal(params)",:vcr do 
    it "Reset account's Billing-Period-To-date unbilled usage balance to zero" do
      response = api.reset_usg_ptd_bal({"acct_no" => 1})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.set_acct_usg_mtd_threshold(params)",:vcr do 
    it "Set the Month-To-date unbilled usage threshold amount on the account for account-holder notifications" do
      response = api.set_acct_usg_mtd_threshold({"acct_no" => 1,"ammount"=> 2000})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.set_acct_usg_ptd_threshold(params)",:vcr do 
    it "Set the Billing-Period-To-date unbilled usage threshold amount on the account on for account-holder notifications" do
      response = api.set_acct_usg_ptd_threshold({"acct_no" => 1,"ammount"=> 2000})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.set_client_usg_mtd_threshold(params)",:vcr do 
    it "Set the Month-To-date unbilled usage threshold amount on the account for client event notification" do
      response = api.set_client_usg_mtd_threshold({"acct_no" => 1,"ammount"=> 2000})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.set_client_usg_ptd_threshold(params)",:vcr do 
    it "Set the Billing-Period-To-date unbilled usage threshold amount on the account for client event notification" do
      response = api.set_client_usg_ptd_threshold({"acct_no" => 1,"ammount"=> 2000})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end
end