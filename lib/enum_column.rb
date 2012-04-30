require "enum_column/version"

module EnumColumn

  module ClassMethods
    def enum_column(attribute, values)
      raise "enum column has to be initialized with a hash" unless values.kind_of? Hash
      class_eval do
        const_set "#{attribute.to_s.capitalize}_values", values.freeze
        const_set "#{attribute.to_s.capitalize}_ids", Hash[*values.to_a.map { |a| [a.last, a.first] }.flatten].freeze
        
        define_method(attribute) do
          enum_column_values = self.class.const_get("#{attribute.to_s.capitalize}_values")
          attribute_value = read_attribute("#{attribute}_id")
          return nil if attribute_value.blank?
          raise "invalid #{attribute} value: '#{attribute_value}' in line: '#{id}'" unless enum_value = enum_column_values[attribute_value]
          return enum_value
        end
        
        define_method("#{attribute}=") do |*args|
          enum_column_ids = self.class.const_get("#{attribute.to_s.capitalize}_ids")
          raise "unsupported state '#{args.first}'" unless enum_column_ids.has_key?(args.first.to_sym)
          value = enum_column_ids[args.first.to_sym]
          write_attribute("#{attribute}_id", value)
          return value
        end
      end
    end
  end
  
  def self.included(base)
    base.extend ClassMethods
  end
end
