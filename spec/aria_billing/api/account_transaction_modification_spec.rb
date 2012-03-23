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

  describe "self.cancel_order(params)",:vcr do 
    it "Cancels an account holder's order and stops all billing related to the order if the following are true" do
      response = api.cancel_order ({ "acct_no" => 1, "order_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.cancel_queued_service_plan(params)",:vcr do 
    it "Cancels all plan changes scheduled to go into effect for a specified account" do
      response = api.cancel_queued_service_plan ({ "account_number" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.cancel_standing_order(params)",:vcr do 
    it "Cancels all future orders in a standing order" do
      response = api.cancel_standing_order ({ "standing_order_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.cancel_unconsumed_credit(params)",:vcr do 
    it "Deletes all unused credits associated with a particular coupon" do
      response = api.cancel_unconsumed_credit ({ "acct_no" => 1, "coupon_cd" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.create_advaced_service_credit(params)",:vcr do 
    it "Creates a one-time service credit or recurring service credit for a specified account" do
      response = api.create_advaced_service_credit ({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end   

  describe "self.disable_standing_usage(params)",:vcr do 
    it "Disables a particular standing usage record for a specified account" do
      response = api.disable_standing_usage ({ "acct_no" => 1, "standing_usage_rec_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.record_standing_order(params)",:vcr do 
    it "Creates a pre-defined, recurring order called a standing order" do
      params = { "account_no" => 1, "billing_interval_units" => 1, "times_to_bill" => 2, "client_sku" => 'Test', "units" => 100, "amount" => 10000, "unit_discount_amount" => 10 }
      response = api.record_standing_order params

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("standing_order_no")
    end
  end

  describe "self.reinstate_transaction(params)",:vcr do 
    it "Reinstates a previously voided transaction associated with a specified account number and transaction ID" do
      response = api.reinstate_transaction ({ "account_no" => 1, "transaction_id" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("new_transaction_id")
    end
  end

  describe "self.transfer_account_balance(params)",:vcr do 
    it "Transfer the balance from one account to another account" do
      params = { "source_account_no" => 1, "target_account_no" => 2 }
      response = api.transfer_account_balance params

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("transaction_id")
      response.should have_key("balance_transferred")
    end
  end                                
end