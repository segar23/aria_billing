require "aria_billing"
require "vcr"

AriaBilling::Configuration.auth_key = "auth_key"
AriaBilling::Configuration.client_no = "client_no"
AriaBilling::Configuration.url = "url"

VCR.configure do |c|
  current_dir = File.dirname(__FILE__)
  c.cassette_library_dir = "#{current_dir}/fixtures/vcr_cassettes"
  c.hook_into :webmock
end
