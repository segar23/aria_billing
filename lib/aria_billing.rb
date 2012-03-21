require "httparty"
require "json"
require "aria_billing/exceptions"
require "aria_billing/configuration"
require 'aria_billing/service'

module AriaBilling
  include HTTParty

  def self.make_request(opts={})
    opts = request_defaults.merge opts
    post(AriaBilling::Configuration.url, body: opts)
  end

  def self.request_defaults
    { output_format: "json" }.merge AriaBilling::Configuration.credentials
  end

  class << self
    AriaBilling::Service::CALLS.each do |call_name|
      define_method(call_name) do |opts={}|
        params = { rest_call: call_name }.merge(opts)
        make_request params
      end
    end
  end
end
