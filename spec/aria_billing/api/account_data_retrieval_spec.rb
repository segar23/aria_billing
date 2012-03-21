require 'spec_helper'

describe "Account Data Retrieval" do

  def api
    AriaBilling
  end
  
  describe "self.authenticate_client(params)",:vcr do
    it "check client credentials" do 
      pending "TODO"
      response = api.authenticate_client({})
    end
  end


  describe "self.get_acct_comments(params)",:vcr do
    it "Returns the comments associated with a particular account" do
      params = { "acct_no" => 1, "date_range_start" => '2010-01-01', "date_range_end" => '2012-03-20' }
      response = api.get_acct_comments params

      response.should have_key("acct_comments")
      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
   end

  describe "self.get_acct_details_all(params)",:vcr do
    it "Returns all avalible information about an account" do 
      response = api.get_acct_details_all({ "acct_no" => 1})

      response.should have_key("first_name")
      response.should have_key("mi")
      response.should have_key("last_name")
      response.should have_key("userid")
      response.should have_key("birthdate")
      response.should have_key("job_title")
      response.should have_key("salutation")
      response.should have_key("senior_acct_no")
      response.should have_key("client_acct_id")
      response.should have_key("resp_level_cd")
      response.should have_key("is_test_acct")
      response.should have_key("alt_email")
      response.should have_key("address1")
      response.should have_key("address2")
      response.should have_key("city")
      response.should have_key("state_prov")
      response.should have_key("locality")
      response.should have_key("postal_code")
      response.should have_key("country")
      response.should have_key("company_name")
      response.should have_key("cell_phone_npa")
      response.should have_key("cell_phone_nxx")
      response.should have_key("cell_phone_suffix")
      response.should have_key("fax_phone")
      response.should have_key("intl_cell_phone")
      response.should have_key("intl_phone")
      response.should have_key("phone_extension")
      response.should have_key("phone_npa")
      response.should have_key("phone_nxx")
      response.should have_key("phone_suffix")
      response.should have_key("work_phone_extension")
      response.should have_key("work_phone_npa")
      response.should have_key("work_phone_nxx")
      response.should have_key("work_phone_suffix")
      response.should have_key("bill_day")
      response.should have_key("created")
      response.should have_key("date_to_expire")
      response.should have_key("date_to_suspend")
      response.should have_key("last_arrears_bill_thru_date")
      response.should have_key("last_bill_date")
      response.should have_key("last_bill_thru_date")
      response.should have_key("next_bill_date")
      response.should have_key("plan_date")
      response.should have_key("status_date")
      response.should have_key("status_degrade_date")
      response.should have_key("status_cd")
      response.should have_key("status_label")
      response.should have_key("plan_no")
      response.should have_key("plan_name")
      response.should have_key("plan_units")
      response.should have_key("notify_method")
      response.should have_key("notify_method_name")
      response.should have_key("PASSWORD")
      response.should have_key("pin")
      response.should have_key("secret_question")
      response.should have_key("secret_question_answer")
      response.should have_key("pay_method")
      response.should have_key("pay_method_name")
      response.should have_key("currency_cd")
      response.should have_key("tax_id")
      response.should have_key("billing_email")
      response.should have_key("billing_first_name")
      response.should have_key("billing_middle_initial")
      response.should have_key("billing_last_name")
      response.should have_key("billing_address1")
      response.should have_key("billing_address2")
      response.should have_key("billing_city")
      response.should have_key("billing_state")
      response.should have_key("billing_locality")
      response.should have_key("billing_zip")
      response.should have_key("billing_country")
      response.should have_key("cc_suffix")
      response.should have_key("cc_expire_mm")
      response.should have_key("cc_expire_yyyy")
      response.should have_key("cc_id")
      response.should have_key("bank_acct_suffix")
      response.should have_key("bank_routing_no")
      response.should have_key("billing_cell_phone_npa")
      response.should have_key("billing_cell_phone_nxx")
      response.should have_key("billing_cell_phone_suffix")
      response.should have_key("billing_company_name")
      response.should have_key("billing_intl_phone")
      response.should have_key("billing_phone_extension")
      response.should have_key("billing_phone_npa")
      response.should have_key("billing_phone_nxx")
      response.should have_key("billing_phone_suffix")
      response.should have_key("billing_work_phone_extension")
      response.should have_key("billing_work_phone_npa")
      response.should have_key("billing_work_phone_nxx")
      response.should have_key("billing_work_phone_suffix")
      response.should have_key("balance")
      response.should have_key("acct_create_client_receipt_id")
      response.should have_key("plan_client_receipt_id")
      response.should have_key("status_client_receipt_id")
      response.should have_key("taxpayer_id")
      response.should have_key("promo_cd")
      response.should have_key("error_code")
      response.should have_key("alt_msg_template_no")
      response.should have_key("seq_func_group_no")
      response.should have_key("error_msg")
    end
  end

  describe "self.get_acct_groups_by_acct(params)",:vcr do 
    it "Returns the list of account groups to which an account belongs" do
      response = api.get_acct_groups_by_acct({ "acct_no" => 1, "user_id" => 'PSLcorp'})

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("acct_groups")
    end
  end

  describe "self.get_acct_no_from_userid(params)",:vcr do
    it "Returns the account number associated with a specified user ID" do
      pending "TODO"
      response = api.get_acct_no_from_userid({ "user_id" => 'PSLcorp'})
      
      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.get_acct_notify_method(params)", :vcr do
    it "Returns the method by which statements are sent to a specified account" do
      response = api.get_acct_notify_method({ "account_no" => 1})

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("notify_method")
      response.should have_key("notify_method_name")
    end
  end

  describe "self.get_acct_plan_contract(params)", :vcr do
    it "Returns any contract currently associated with a specified account and plan" do
      response = api.get_acct_plan_contract({ "acct_no" => 1, "plan_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("acct_plan_contract")
    end
  end

  describe "self.get_acct_plan_history(params)", :vcr do
    it "Returns the list of plans currently and previously assigned to an account" do
      response = api.get_acct_plan_history({ "account_number" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("plan_hist")
    end
  end

  describe "self.get_acct_plans(params)", :vcr do
    it "Returns the details of master and supplemental plans most recently assigned to a specified account" do
      response = api.get_acct_plans({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("acct_plans")
    end
  end

  describe "self.get_acct_plans_all(params)", :vcr do
    it "Returns the plan, service, and rate schedule data for all master and supplemental assigned to a specified account" do
      response = api.get_acct_plans_all({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("all_acct_plans")
    end
  end

  describe "self.get_acct_supp_fields(params)", :vcr do
    it "Returns a list of supplemental field names nad values associated with an account" do
      response = api.get_acct_supp_fields({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("supp_fields")
    end
  end

  describe "self.get_acct_trans_history(params)", :vcr do
    it "Returns a list of financial transactions associated with an account" do
      response = api.get_acct_trans_history({ "account_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("history")
    end
  end
 
  describe "self.get_accts_w_existing_pay_meth(params)", :vcr do
    it "For the given input specified electronic form of payment" do
      pending "TODO" 
      response = api.get_accts_w_existing_pay_meth({})
    end
  end

  describe "self.get_avail_child_plans_for_acct(params)", :vcr do
    it "Returns a list of financial transactions associated with an account" do
      response = api.get_avail_child_plans_for_acct({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("plans")
    end
  end

  describe "self.get_avail_child_plans_for_acct_all(params)", :vcr do
    it "Return all avalible child plans avalible for assignment to the given acct" do
      response = api.get_avail_child_plans_for_acct_all({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("all_plans")
    end
  end

  describe "self.get_child_accts(params)", :vcr do
    it "Return all child account numbers associated with a specified parent account number" do
      response = api.get_child_accts({ "parent_acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("child_accts")
    end
  end

  describe "self.get_order_items(params)", :vcr do
    it "Returns information about the items in a particular order associeted with a specified account" do
      response = api.get_order_items({ "order_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("order_items")
    end
  end

  describe "self.get_queued_service_plans(params)", :vcr do
    it "Returns a list of master plan changes schedule to go into effect for a specified account" do
      response = api.get_queued_service_plans({ "account_number" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("queued_plans")
      response.should have_key("current_rate_schedule_no")
    end
  end

  describe "self.get_recurring_credit_info(params)", :vcr do
    it "Returns a list of recurring credits associated with a specified account" do
      response = api.get_recurring_credit_info({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("recurring_credit_info")
    end
  end

  describe "self.get_standing_usage(params)", :vcr do
    it "Returns all active standing usage records associated with a specified account" do
      response = api.get_standing_usage({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("su")
    end
  end

  describe "self.get_supp_field_values(params)", :vcr do
    it "Returns the values for a particular supplemental field associated with a specified account" do
      response = api.get_supp_field_values({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("supp_field_values")
    end
  end

  describe "self.get_usage_history(params)", :vcr do
    it "Returns the usage records associated with a specified account for a particular date range" do
      response = api.get_usage_history({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("usage_history_records")
    end
  end

  describe "self.get_userid_from_acct_no(params)", :vcr do
    it "Returns the user ID associated with a specified account number" do
      response = api.get_userid_from_acct_no({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.userid_exists(params)",:vcr do
    it "Determines whether a specified user ID is already in use" do
      response = api.userid_exists({"user_id" => 'PSLcorp'})

      response.should have_key("error_code")
      response.should have_key("error_msg")

    end
  end

  describe "self.userid_is_available(params)",:vcr do
    it "Determines whether a specified user ID is avalible for use" do
      response = api.userid_is_available({"user_id" => 'PSLcorp'})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end
end