# frozen_string_literal: true

module AthenaHealth
  # all parsed models should inherit from here
  class BaseModel
    include Virtus.model

    def self.model_attribute(field_name:, klass:, array: false)
      define_method(field_name.to_sym) do
        instance_variable_get("@#{field_name}")
      end

      instance_variable_set(:@internal_detail_fields, (@internal_detail_fields || []) + [{
        field_name: field_name,
        field_klass: klass,
        array: array
      }])
    end

    def initialize(args)
      super(args)
      parse_sub_objects(args)
    end

    private

    def parse_sub_objects(args)
      return if self.class.instance_variable_get(:@internal_detail_fields).nil?

      self.class.instance_variable_get(:@internal_detail_fields).each do |internal_detail_field|
        value = sub_object_value(internal_detail_field, args)

        next if value.nil?

        instance_variable_set("@#{internal_detail_field[:field_name]}", value)
      end
    end

    def sub_object_value(internal_detail_field, args)
      val = args[internal_detail_field[:field_name]]
      return nil if val.nil?
      return internal_detail_field[:field_klass].new(val) unless internal_detail_field[:array] == true

      val.map do |x|
        internal_detail_field[:field_klass].new(x)
      end
    end
  end
end
