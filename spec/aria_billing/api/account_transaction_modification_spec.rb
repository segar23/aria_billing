require 'spec_helper'

describe "Account Transaction Modification" do

  def api
    AriaBilling
  end

  describe "self.apply_cash_credit(params)",:vcr do 
    it "Issues a credit to a specified amount" do
      params = { "account_no" => 1, "credit_amount" => 20000, "credit_reason_code" => 1 }	
      response = api.apply_cash_credit params

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("transaction_id")
    end
  end

  describe "self.apply_coupon_to_acct(params)",:vcr do 
    it "Assigns a coupon code to a specified account" do
      response = api.apply_coupon_to_acct ({ "acct_no" => 1})

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("user_success_msg")
    end
  end

  describe "self.apply_service_credit(params)",:vcr do 
    it "Applies a credit to a future invoice" do
      params = { "account_no" => 1, "credit_amount" => 20000, "credit_reason_code" => 1 } 
      response = api.apply_service_credit params

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("credit_id")
    end
  end

  describe "self.assing_custom_acct_rate(params)",:vcr do 
    it "Applies custom rates to a particular plan and service assigned to specified account" do
      params = { "acct_no" => 1, "plan_no" => 1, "service_no" => 1, "custom_acct_rates" => { "rate_seq_no" => 1, "rate_per_unit" => 2, "from_unit" => 1, "to_unit" => 2 } } 
      response = api.assing_custom_acct_rate params

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end
end