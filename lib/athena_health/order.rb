module AthenaHealth
  class Order < BaseModel
    attribute :status,            String
    attribute :description,       String
    attribute :documentid,        Integer
    attribute :documentationonly, Boolean
    attribute :classdescription,  String
    attribute :orderingprovider,  String
    attribute :assigneduser,      String
    attribute :dateordered,       String
  end
end
