module AthenaHealth
  class Reaction < BaseModel
    attribute :reactionname,       String
    attribute :snomedcode,         Integer
    attribute :severity,           String
    attribute :severitysnomedcode, Integer
  end
end
