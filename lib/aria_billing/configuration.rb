module AriaBilling
  class Configuration
    ATTS = [ :api_key, :client_no, :url ]

    class << self
      attr_writer *ATTS
    end

    def self.required_attribute(*attributes) # :nodoc:
      attributes.each do |attribute|
        (class << self; self; end).send(:define_method, attribute) do
          attribute_value = instance_variable_get("@#{attribute}")
          raise ConfigurationError.new(attribute.to_s, "needs to be set") unless attribute_value
          attribute_value
        end
      end
    end

    required_attribute *ATTS
  end
end
