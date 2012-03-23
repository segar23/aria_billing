require 'spec_helper'

describe "Account Transaction Retrieval" do

  def api
    AriaBilling
  end

  describe "self.get_acct_has_ordered_sku(params)",:vcr do 
    it "Indicates whether an account has ever ordered or paid for a specified inventorty item (SKU)" do
      params = { "acct_no" => 1, "sku" => 'Test' }	
      response = api.get_acct_has_ordered_sku params

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("ordered_ind")
      response.should have_key("billed_ind")
      response.should have_key("paid_ind")
    end
  end

  describe "self.get_family_trans_history(params)",:vcr do 
    it "Returns the transaction history of parent and child accounts" do
      response = api.get_family_trans_history ({ "parent_acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("fam_trans")
    end
  end

  describe "self.get_invoice_details(params)",:vcr do 
    it "Returns the line items of a specified invoice" do
      response = api.get_invoice_details ({ "acct_no" => 1, "src_transaction_id" => 2 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("is_pending_ind")
    end
  end

  describe "self.get_order(params)",:vcr do 
    it "Returns information about the orders associated with a specified account" do
      response = api.get_order ({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("order")
    end
  end

  describe "self.get_payment_applications(params)",:vcr do 
    it "Returns a list of charge transactions against which a particular credit transaction has been applied for a specified account" do
      response = api.get_payment_applications ({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("payment_applications")
    end
  end

  describe "self.get_payments_on_invoice(params)",:vcr do 
    it "Returns a list of credit transactions that have been applied a particular charge transaction for a specified account" do
      response = api.get_payments_on_invoice ({ "acct_no" => 1,"src_transaction_id" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("invoice_payments")
    end
  end

  describe "self.get_pending_invoice_no(params)",:vcr do 
    it "Returns the invoice number of a pending invoice associated with a specified account" do
      response = api.get_pending_invoice_no ({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("invoice_no")
    end
  end  

  describe "self.get_refund_details(params)",:vcr do 
    it "Returns refund information" do
      response = api.get_refund_details ({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("refund_details")
    end
  end  

  describe "self.get_standing_order(params)",:vcr do 
    it "Provides information about one or more standing orders associated with a specified account" do
      response = api.get_standing_order ({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("so")
    end
  end  

  describe "self.get_standing_order_hist(params)",:vcr do 
    it "Provides information about the orders that have been created usuing a specified standing order" do
      response = api.get_standing_order_hist ({ "standing_order_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("order")
    end
  end  
end