module AthenaHealth
  class Order < BaseModel
    attribute :orderid,           Integer
    attribute :status,            String
    attribute :description,       String
    attribute :ordertype,         String
    attribute :documentid,        Integer
    attribute :documents,         Array
    attribute :documentationonly, Boolean
    attribute :classdescription,  String
    attribute :orderingprovider,  String
    attribute :assigneduser,      String
    attribute :dateordered,       String
  end
end
