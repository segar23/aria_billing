require "aria_billing"
require "vcr"

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

module SupportSpecHelper
  def self.use_development_credentials
    AriaBilling::Configuration.auth_key = "8Vn848nuRPa58jht9jBBpWvSUVsn3fnB"
    AriaBilling::Configuration.client_no = "4950701"
    AriaBilling::Configuration.url = "https://secure.future.stage.ariasystems.net/api/ws/api_ws_class_dispatcher.php"
  end
end

SupportSpecHelper.use_development_credentials
