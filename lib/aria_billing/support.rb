module AriaBilling
  class Support
    API_CALLS = [ 'get_country_from_ip','gen_random_string','get_client_countries',
                  'userid_exists','userid_is_available','validate_session',
                  'get_web_replacement_vals','reset_usg_mtd_bal','reset_usg_ptd_bal',
                  'set_acct_usg_mtd_threshold','set_acct_usg_ptd_threshold','set_client_usg_mtd_threshold',
                  'set_client_usg_ptd_threshold','get_unbilled_usage_summary','create_acct_complete',
                  'adjust_billing_dates','assign_collections_acct_group','assign_functional_acct_group',
                  'assign_supp_plan','ban_acct','cancel_acct_plan_contract','cancel_supp_plan',
                  'close_acct_installation','create_acct_plan_contract','modify_acct_plan_contract',
                  'modify_supp_plan','modify_acct_supp_field','remove_acct_from_group',
                  'remove_custom_acct_rates','remove_pay_mehod','replace_supp_plan',
                  'set_pay_method_bank_draft', 'set_pay_method_cc','set_pay_method_net_terms',
                  'set_payment_responsibility','update_acct_complete','update_acct_contact',
                  'update_acct_credentials','update_acct_notify','update_acct_status',
                  'update_supp_fields','update_existing_billing_info','get_acct_comments',
                  'authenticate_client','get_acct_details_all','get_acct_groups_by_acct',
                  'get_acct_notify_method','get_acct_no_from_userid','get_acct_plan_contract',
                  'get_acct_plan_history','get_acct_plans','get_acct_plans_all',
                  'get_acct_supp_fields','get_acct_trans_history','get_accts_w_existing_pay_meth',
                  'get_avail_child_plans_for_acct','get_avail_child_plans_for_acct_all','get_child_accts',
                  'get_order_items','get_queued_service_plans','get_recurring_credit_info',
                  'get_standing_usage','get_supp_field_values','get_usage_history']

    class << self
      API_CALLS.each do |call_name|
        define_method(call_name) do |opts={}|
          params = { rest_call: call_name }.merge(opts)
          response = AriaBilling.make_request(params)
        end
      end
    end

  end
end
