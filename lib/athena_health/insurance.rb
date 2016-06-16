module AthenaHealth
  class Insurance < BaseModel
    attribute :affiliations,                        Array
    attribute :insuranceplanname,                   String
    attribute :insurancepackageid,                  Integer
    attribute :addresslist,                         Array
    attribute :insurancepolicyholdercountrycode,    String
    attribute :sequencenumber,                      Integer
    attribute :insuranceplanname,                   String
    attribute :insurancetype,                       String
    attribute :insurancepolicyholderlastname,       String
    attribute :insurancephone,                      String
    attribute :insuranceidnumber,                   String
    attribute :relationshiptoinsuredid,             Integer
    attribute :insuranceid,                         Integer
    attribute :insurancepolicyholder,               String
    attribute :insurancepolicyholderdob,            String
    attribute :eligibilitylastchecked,              String
    attribute :relationshiptoinsured,               String
    attribute :eligibilitystatus,                   String
    attribute :insurancepolicyholderfirstname,      String
    attribute :insurancepolicyholdersex,            String
    attribute :eligibilityreason,                   String
    attribute :insurancepolicyholdercountryiso3166, String
    attribute :eligibilitymessage,                  String
    attribute :ircname,                             String
  end
end
