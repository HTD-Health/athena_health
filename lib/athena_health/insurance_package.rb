module AthenaHealth
  class InsurancePackage < BaseModel
    attribute :ranking,                  Integer
    attribute :name,                     String
    attribute :percentage,               Float
    attribute :insurancepackageid,       Integer
    attribute :phone,                    String
    attribute :insuranceproducttypename, String
    attribute :state,                    String
    attribute :zip,                      String
    attribute :city,                     String
    attribute :address,                  String
  end
end
