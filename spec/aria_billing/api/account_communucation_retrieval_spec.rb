require 'spec_helper'

describe "Account Comunication Retrieval" do

  def api
    AriaBilling
  end

  describe "self.get_acct_invoice_history(params)",:vcr do 
    it "Adjust the billing date for a specified account to a date in the future or date in the past" do
      response = api.get_acct_invoice_history ({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("invoice_history")
    end
  end
end