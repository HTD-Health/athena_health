module AthenaHealth
  class Facility < BaseModel
    attribute :facilityid,   Integer
    attribute :name,         String
    attribute :city,         String
    attribute :pharmacytype, String
    attribute :faxnumber,    String
    attribute :address,      String
    attribute :distance,     String
    attribute :zipcode,      String
    attribute :state,        String
    attribute :phonenumber,  String
  end
end
