module AthenaHealth
  class Note < BaseModel
    attribute :notetext,  String
    attribute :noteid,    Integer
    attribute :created,   String
    attribute :createdby, String
  end
end
