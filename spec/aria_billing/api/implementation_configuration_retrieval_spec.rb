require 'spec_helper'

describe "Implementation Configuration Retrieval" do

  def api
    AriaBilling
  end

  describe "self.clear_reg_uss_config_params(params)",:vcr do
    it "Removes all of the parameter name-value pairs in a specified configuration" do
      response = api.clear_reg_uss_config_params ({ "set_name" => 'Test'})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.clear_reg_uss_params(params)",:vcr do
    it "Removes all of the parameter name-value associated with a particular session ID" do
      response = api.clear_reg_uss_config_params ({ "session_id" => 'Test'})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.client_has_event_class(params)",:vcr do
    it "Indicates whether a client is subcribed to the specified even notification class" do
      response = api.client_has_event_class ({ "class_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("response")
    end
  end

  describe "self.delete_reg_uss_config_params(params)",:vcr do
    it "Removes the parameter name-value pairs in a specified configuration" do
      response = api.delete_reg_uss_config_params ({ "set_name" => 'Test', "param_name" => 'Test'})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.delete_reg_uss_params(params)",:vcr do
    it "Removes the parameter name-value pairs in a particular session" do
      response = api.delete_reg_uss_params ({ "session_id" => 'Test', "param_name" => 'Test'})

      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.get_acct_groups_by_client(params)",:vcr do
    it "Returns the list of account groups associated with a client" do
      response = api.get_acct_groups_by_client

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("acct_groups")
    end
  end

  describe "self.get_acct_payment_methods(params)",:vcr do
    it "Returns the historical data related to the account's payment methods" do
      response = api.get_acct_payment_methods ({ "acct_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("acct_pay_methods")
    end
  end

  describe "self.get_auf_status(params)",:vcr do
    it "Returns the statistics for a specified usage file" do
      response = api.get_auf_status 

      response.should have_key("status_cd")
      response.should have_key("load_date_time")
      response.should have_key("recs_received")
      response.should have_key("recs_loaded")
      response.should have_key("recs_failed")
      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.get_avail_child_plans_for_plan(params)",:vcr do
    it "Return array of all available child plans subordinate to the given input plan number" do
      response = api.get_avail_child_plans_for_plan ({ "in_plan_no" => 1 })

      response.should have_key("error_code")
      response.should have_key("error_msg")
      response.should have_key("plans")
    end
  end

  describe "self.get_client_countries(params)",:vcr do
    it "return a list of countries assigned to a client" do
      response = api.get_client_countries({})

      response.should have_key("client_country")
      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.get_web_replacement_vals(params)",:vcr do
    it "get an array of values for an array of input web replacement strings" do 
      response = api.get_web_replacement_vals({"in_replacement_names" => "One|Two"})

      response.should have_key("web_vals_out")
      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end

  describe "self.validate_session(params)",:vcr do
   it "Determines the validity of a specified session and the user with session ID" do
      response = api.validate_session({"session_id" => '123456'})

      response.should have_key("user_id")
      response.should have_key("account_no")
      response.should have_key("error_code")
      response.should have_key("error_msg")
    end
  end
end