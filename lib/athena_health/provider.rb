module AthenaHealth
  class Provider < BaseModel
    attribute :firstname,            String
    attribute :specialty,            String
    attribute :homedepartment,       String
    attribute :acceptingnewpatients, Boolean
    attribute :providertypeid,       Boolean
    attribute :billable,             Boolean
    attribute :displayname,          String
    attribute :ansinamecode,         String
    attribute :lastname,             String
    attribute :providerid,           Integer
    attribute :providerusername,     String
    attribute :ansispecialtycode,    String
    attribute :hideinportal,         Boolean
    attribute :entitytype,           String
    attribute :npi,                  Integer
    attribute :providertype,         String

    def fullname
      "#{firstname} #{lastname}"
    end
  end
end
