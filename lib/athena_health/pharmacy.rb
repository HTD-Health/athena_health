module AthenaHealth
  class Pharmacy < BaseModel
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
    attribute :pharmacytype,         String
    attribute :receivertype,         String
  end
end
