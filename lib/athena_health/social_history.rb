module AthenaHealth
  class SocialHistory  < BaseModel
    attribute :templates, Array[Template]
    attribute :questions, Array[Question]
  end
end
