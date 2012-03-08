require "httparty"
require "aria_billing/exceptions"
require "aria_billing/configuration"

module AriaBilling
  def self.make_request(opts)
    opts.merge! AriaBilling::Configuration.credentials
    HTTParty.post(AriaBilling::Configuration.url, body: opts)
  end
end
