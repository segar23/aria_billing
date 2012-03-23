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
end