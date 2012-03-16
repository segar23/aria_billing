module AriaBilling
  class Support
    API_CALLS = [ 'get_country_from_ip','gen_random_string','get_client_countries',
                  'userid_exists','userid_is_available','validate_session',
                  'get_web_replacement_vals','reset_usg_mtd_bal','reset_usg_ptd_bal',
                  'set_acct_usg_mtd_threshold','set_acct_usg_ptd_threshold','set_client_usg_mtd_threshold',
                  'set_client_usg_ptd_threshold']

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
