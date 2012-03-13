require "aria_billing"
require "vcr"

AriaBilling::Configuration.auth_key = "auth_key"
AriaBilling::Configuration.client_no = "client_no"
AriaBilling::Configuration.url = "url"

VCR.configure do |c|
  current_dir = File.dirname(__FILE__)
  c.cassette_library_dir = "#{current_dir}/fixtures/vcr_cassettes"
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |c|
  # so we can use `:vcr` rather than `:vcr => true`;
  # in RSpec 3 this will no longer be necessary.
  c.treat_symbols_as_metadata_keys_with_true_values = true
end
