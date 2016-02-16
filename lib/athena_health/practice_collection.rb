module AthenaHealth
  class PracticeCollection < BaseCollection
    attribute :practiceinfo, Array[Practice]
  end
end
