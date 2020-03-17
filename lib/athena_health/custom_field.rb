# frozen_string_literal: true

module AthenaHealth
  class CustomField < BaseModel
    attribute :ordering, String
    attribute :name, String
    attribute :length, String
    attribute :type, String
    attribute :disallowupdateyn, Boolean
    attribute :casesensitiveyn, Boolean
    attribute :searchableyn, Boolean
    attribute :selectyn, Boolean

    attribute :customfieldid, Integer
    attribute :selectlist, Array[Hash]
  end
end
