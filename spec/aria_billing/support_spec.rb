require 'spec_helper'

describe AriaBilling::Support do

  describe "self.gen_random_string(params)",:vcr do
    it "generates a random string" do
      params = { "rand_type" => 'A', "rand_length" => 5, "rand_case" => 'U' }
      response = AriaBilling::Support.gen_random_string params

      response.should have_key("random_string")
      response.should have_key("error_code")
      response.should have_key("error_msg")

    end
  end

  describe "self.get_client_countries(params)",:vcr do
    it "return a list of countries assigned to a client" do
      response = AriaBilling::Support.get_client_countries({})

      response.should have_key("client_country")
      response.should have_key("error_code")
      response.should have_key("error_msg")

    end
  end

  describe "self.userid_exists(params)",:vcr do
    it "Determines whether a specified user ID is already in use" do
      response = AriaBilling::Support.userid_exists({"user_id" => 'PSLcorp'})

      response.should have_key("error_code")
      response.should have_key("error_msg")

    end
  end

  describe "self.userid_is_available(params)",:vcr do
    it "Determines whether a specified user ID is avalible for use" do
      response = AriaBilling::Support.userid_is_available({"user_id" => 'PSLcorp'})

      response.should have_key("error_code")
      response.should have_key("error_msg")

    end
  end

  describe "self.validate_session(params)",:vcr do
   it "Determines the validity of a specified session and the user with session ID" do
      response = AriaBilling::Support.validate_session({"session_id" => '123456'})

      response.should have_key("user_id")
      response.should have_key("account_no")
      response.should have_key("error_code")
      response.should have_key("error_msg")

    end
  end

  describe "self.get_web_replacement_vals(params)",:vcr do
    it "get an array of values for an array of input web replacement strings" do 
      response = AriaBilling::Support.get_web_replacement_vals({"in_replacement_names[0]" => "One|Two"})

      response.should have_key("web_vals_out")
      response.should have_key("error_code")
      response.should have_key("error_msg")

    end
  end

# Account Unbilled Usage Summary Information

  describe "self.get_unbilled_usage_summary(params)",:vcr do
    it "Returns all information related to summary value of unbilled usage on the account" do
      response = AriaBilling::Support.get_unbilled_usage_summary({"acct_no" => 1})

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
      response = AriaBilling::Support.reset_usg_mtd_bal({"acct_no" => 1})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.reset_usg_ptd_bal(params)",:vcr do 
    it "Reset account's Billing-Period-To-date unbilled usage balance to zero" do
      response = AriaBilling::Support.reset_usg_mtd_bal({"acct_no" => 1})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.set_acct_usg_mtd_threshold(params)",:vcr do 
    it "Set the Month-To-date unbilled usage threshold amount on the account for account-holder notifications" do
      response = AriaBilling::Support.set_acct_usg_mtd_threshold({"acct_no" => 1,"ammount"=> 2000})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.set_acct_usg_ptd_threshold(params)",:vcr do 
    it "Set the Billing-Period-To-date unbilled usage threshold amount on the account on for account-holder notifications" do
      response = AriaBilling::Support.set_acct_usg_ptd_threshold({"acct_no" => 1,"ammount"=> 2000})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.set_client_usg_mtd_threshold(params)",:vcr do 
    it "Set the Month-To-date unbilled usage threshold amount on the account for client event notification" do
      response = AriaBilling::Support.set_client_usg_mtd_threshold({"acct_no" => 1,"ammount"=> 2000})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.set_client_usg_ptd_threshold(params)",:vcr do 
    it "Set the Billing-Period-To-date unbilled usage threshold amount on the account for client event notification" do
      response = AriaBilling::Support.set_client_usg_ptd_threshold({"acct_no" => 1,"ammount"=> 2000})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

# Account Creation

  describe "self.create_acct_complete(params)",:vcr do
    it "Creates an account with an extensive set of data elements" do
      response = AriaBilling::Support.create_acct_complete({"master_plan_no" => 1})

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

#Account Modification

  describe "self.adjust_billing_dates(params)",:vcr do 
    it "Adjust the billing date for a specified account to a date in the future or date in the past" do
      params = { "acct_no" => 1, "action_directive" => 1, "adjustament_days" => 1,"comments" => "Test" }
      response = AriaBilling::Support.adjust_billing_dates params

      response.should have_key("error_code")
      response.should have_key("error_msg")

    end
  end

  describe "self.assign_collections_acct_group(params)",:vcr do
    it "Assigns a specified account to a collections account group" do
      response = AriaBilling::Support.assign_collections_acct_group({ "acct_no" => 1, "group_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")

    end
  end

  describe "self.assign_functional_acct_group(params)",:vcr do
    it "Assigns a specified account to a functional account group" do
      response = AriaBilling::Support.assign_functional_acct_group({ "acct_no" => 1, "group_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")

    end
  end

  describe "self.assign_supp_plan(params)",:vcr do
    it "Assigns one supplemental plan to a specified account" do
      response = AriaBilling::Support.assign_supp_plan({ "acct_no" => 1, "supp_plan_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("proration_result_amount")
      response.should have_key("invoice_no")
      response.should have_key("supp_plan_line_items")
      response.should have_key("total_charges_before_tax")
      response.should have_key("total_tax_charges")
      response.should have_key("total_credit")

    end
  end

  describe "self.ban_acct(params)",:vcr do
    it "Sets an account's status to temporary ban" do
      response = AriaBilling::Support.ban_acct({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")

    end
  end

  describe "self.cancel_acct_plan_contract(params)",:vcr do
    it "Cancels a contract assigned to a specified account holder" do
      response = AriaBilling::Support.cancel_acct_plan_contract({ "acct_no" => 1, "contract_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")

    end
  end

  describe "self.cancel_supp_plan(params)",:vcr do
    it "Cancels the supplemental plans assigned to a specified account" do
      response = AriaBilling::Support.cancel_supp_plan({ "acct_no" => 1, "supp_plan_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("proration_result_amount")
      response.should have_key("invoice_no")

    end
  end

  describe "self.close_acct_installation(params)",:vcr do
    it "For accounts in the pending installation status, marks the installation" do
      response = AriaBilling::Support.close_acct_installation({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")

    end
  end

  describe "self.create_acct_plan_contract(params)",:vcr do
    it "Creates a contract for a specified account holder and plan" do
      response = AriaBilling::Support.create_acct_plan_contract({ "acct_no" => 1, "plan_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("contract_no")

    end
  end

  describe "self.get_country_from_ip(params)", :vcr do
    it "returns the country code and name of a given IP" do
      response = AriaBilling::Support.get_country_from_ip("ip_address" => "64.71.167.222")

      response.should have_key("country_code")
      response.should have_key("country_name")
      response.should have_key("error_code")
      response.should have_key("error_msg")

    end
  end

  describe "self.modify_acct_plan_contract(params)",:vcr do
    it "modifies a particular contract assigned to a specified account" do
      response = AriaBilling::Support.modify_acct_plan_contract({ "acct_no" => 1, "contract_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")

    end
  end

end
