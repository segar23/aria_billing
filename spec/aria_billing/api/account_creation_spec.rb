require 'spec_helper'

describe "Account Creation" do

  def api
    AriaBilling
  end

  describe "self.create_acct_complete(params)",:vcr do
    it "Creates an account with an extensive set of data elements" do
      response = api.create_acct_complete({"master_plan_no" => 1})

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("acct_no")
      response.should have_key("out_userid")
      response.should have_key("invoicing_error_code")
      response.should have_key("invoicing_error_msg")
      response.should have_key("invoice_no")
      response.should have_key("proc_cvv_response")
      response.should have_key("proc_avs_response")
      response.should have_key("proc_cavv_response")
      response.should have_key("proc_status_code")
      response.should have_key("proc_status_text")
      response.should have_key("proc_payment_id")
      response.should have_key("proc_auth_code")
      response.should have_key("proc_merch_comments")
    end
  end
end