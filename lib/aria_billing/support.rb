module AriaBilling
  class Support
    API_CALLS = [ 'get_country_from_ip','gen_random_string','get_client_countries']

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
