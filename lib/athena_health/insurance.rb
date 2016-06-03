module AthenaHealth
  class Insurance < BaseModel
    attribute :affiliations,       Array
    attribute :insuranceplanname,  String
    attribute :insurancepackageid, Integer
    attribute :addresslist,        Array
  end
end
