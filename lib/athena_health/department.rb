module AthenaHealth
  class Department < BaseModel
    attribute :creditcardtypes,              Array
    attribute :medicationhistoryconsent,     Boolean
    attribute :timezoneoffset,               Fixnum
    attribute :providergroupid,              Integer
    attribute :singleappointmentcontractmax, Integer
    attribute :state,                        String
    attribute :portalurl,                    String
    attribute :city,                         String
    attribute :placeofservicefacility,       Boolean
    attribute :oneyearcontractmax,           Integer
    attribute :latitude,                     Float
    attribute :providergroupname,            String
    attribute :doesnotobservedst,            Boolean
    attribute :departmentid,                 Integer
    attribute :address,                      String
    attribute :placeofservicetypeid,         Integer
    attribute :longitude,                    Float
    attribute :clinicals,                    String
    attribute :timezone,                     Fixnum
    attribute :patientdepartmentname,        String
    attribute :name,                         String
    attribute :placeofservicetypename,       String
    attribute :phone,                        String
    attribute :ecommercecreditcardtypes,     Array
    attribute :zip,                          String
    attribute :communicatorbrandid,          Integer
    attribute :providerlist,                 Array
  end
end
