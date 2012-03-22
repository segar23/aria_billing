require 'spec_helper'

describe "Account Transaction Creation" do

  def api
    AriaBilling
  end

  describe "self.authorize_electronic_payment(params)",:vcr do 
    it "Authorize a credit card for a specified amount" do
      response = api.authorize_electronic_payment ({ "account_number" => 1, "amount" => 20000 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("proc_cvv_response")
      response.should have_key("proc_avs_response")
      response.should have_key("proc_cvv_response")
      response.should have_key("proc_status_code")
      response.should have_key("proc_status_text")
      response.should have_key("proc_payment_id")
      response.should have_key("proc_auth_code")
      response.should have_key("proc_merch_comments")
    end
  end

  describe "self.collect_from_account(params)",:vcr do 
    it "Collects a specified amount from a specified account holder using the electronic method of payment on file" do
      response = api.collect_from_account ({ "account_no" => 1, "amount_to_collect" => 20000 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("proc_cvv_response")
      response.should have_key("proc_avs_response")
      response.should have_key("proc_cvv_response")
      response.should have_key("proc_status_code")
      response.should have_key("proc_status_text")
      response.should have_key("proc_payment_id")
      response.should have_key("proc_auth_code")
      response.should have_key("proc_merch_comments")
      response.should have_key("transaction_id")
    end
  end

  describe "self.create_order(params)",:vcr do 
    it "Creates an invoice for one or more inventory items ordered by a specified account holder" do
      params = { "account_no" => 1, "client_sku" => 'Test', "units" => 2, "amount" => 20000, "unit_discount_amount" => 1000, "bill_immediately" => 1 }
      response = api.create_order params

      response.should have_key("order_no")
      response.should have_key("transaction_id")
      response.should have_key("statement_error_cd")
      response.should have_key("statement_error_msg")
      response.should have_key("proc_cvv_response")
      response.should have_key("proc_avs_response")
      response.should have_key("proc_cvv_response")
      response.should have_key("proc_status_code")
      response.should have_key("proc_status_text")
      response.should have_key("proc_payment_id")
      response.should have_key("proc_auth_code")
      response.should have_key("proc_merch_comments")
      response.should have_key("invoice_no")
      response.should have_key("error_code")
      response.should have_key("error_msg")      
    end
  end

  describe "self.create_order_with_plans(params)",:vcr do 
    it "Allows creation of order and plan changes on a single invoice" do
      params = { "acct_no" => 1, "client_sku" => 'Test', "units" => 2, "amount" => 20000, "supp_plan_no" => 1, "supp_plan_units" => 100 }
      response = api.create_order_with_plans params

      response.should have_key("error_code")
      response.should have_key("order_no")
      response.should have_key("invoice_no")
      response.should have_key("cart_invoice_line_items")
      response.should have_key("collection_error_code")
      response.should have_key("collection_error_msg")
      response.should have_key("statement_error_code")
      response.should have_key("statement_error_msg")
      response.should have_key("transaction_id")
      response.should have_key("proc_cavv_response")
      response.should have_key("proc_avs_response")
      response.should have_key("proc_cvv_response")
      response.should have_key("proc_status_code")
      response.should have_key("proc_status_text")
      response.should have_key("proc_payment_id")
      response.should have_key("proc_auth_code")
      response.should have_key("proc_merch_comments")
      response.should have_key("error_msg")      
    end
  end

  describe "self.gen_invoice(params)",:vcr do
  	it "Generates an incoice for a specified account" do
  	  response = api.gen_invoice ({ "acct_no" => 1 })

  	  response.should have_key("error_code")
  	  response.should have_key("error_msg")
  	  response.should have_key("invoice_no")
    end
  end

  describe "self.manage_pending_invoice(params)",:vcr do
  	it "Approves,discards,or regenerates a pending invoice" do
  	  response = api.manage_pending_invoice ({ "acct_no" => 1 })

  	  response.should have_key("new_invoice_no")
  	  response.should have_key("collection_error_code")
  	  response.should have_key("collection_error_msg")
  	  response.should have_key("statement_error_code")
  	  response.should have_key("statement_error_msg")
  	  response.should have_key("proc_cvv_response")
  	  response.should have_key("proc_avs_response")
  	  response.should have_key("proc_cavv_response")
  	  response.should have_key("proc_status_code")
  	  response.should have_key("proc_status_text")
  	  response.should have_key("proc_payment_id")
  	  response.should have_key("proc_auth_code")
  	  response.should have_key("proc_merch_comments")
  	  response.should have_key("error_code")
  	  response.should have_key("error_msg")
    end
  end

  describe "self.record_external_payment(params)",:vcr do
    it "Records a payment transaction for a payment collected from an account holder without using Aria" do
      response = api.record_external_payment ({ "account_no" => 1, "payment_amount" => 20000 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("transaction_id")
    end
  end

  describe "self.record_out_going_payment(params)",:vcr do
    it "Record remittance to net terms accounts" do
      response = api.record_out_going_payment ({ "account_no" => 1, "payment_amount" => 20000 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("transaction_id")
    end
  end

  describe "self.record_standing_usage(params)",:vcr do
    it "Creates a new standing usage record for a specified account" do
      response = api.record_standing_usage ({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.record_usage(params)",:vcr do
    it "Creates a usage record for a specified account for inclusion in a future invoice" do
      response = api.record_usage ({ "usage_type" => 1, "usage_units" => 100 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("usage_rec_no")
    end
  end
end