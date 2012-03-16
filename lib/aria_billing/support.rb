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
                  'remove_custom_acct_rates','remove_pay_mehod','replace_supp_plan']

    class << self
      API_CALLS.each do |call_name|
        define_method(call_name) do |opts|
          params = { rest_call: call_name }.merge(opts)
          response = AriaBilling.make_request(params)
        end
      end
    end

  end
end
