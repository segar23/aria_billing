module AriaBilling

  # Super class for all AriaBilling exceptions.
  class AriaBillingError < ::StandardError; end

  class ConfigurationError < AriaBillingError
    def initialize(setting, message) # :nodoc:
      super "AriaBilling::Configuration.#{setting} #{message}"
    end
  end

end
