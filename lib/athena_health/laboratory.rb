module AthenaHealth
  class Laboratory < BaseModel
    attribute :clinicalproviderid,   Integer
    attribute :clinicalprovidername, String
    attribute :address1,             String
    attribute :address2,             String
    attribute :city,                 String
    attribute :state,                String
    attribute :zip,                  String
    attribute :phonenumber,          String
    attribute :faxnumber,            String
    attribute :acceptfax,            Boolean
  end
end
