require "httparty"
require "aria_billing/exceptions"
require "aria_billing/configuration"

module AriaBilling
  include HTTParty

  def self.make_request(opts)
    opts.merge! AriaBilling::Configuration.credentials
    post(AriaBilling::Configuration.url, body: opts)
  end
end
