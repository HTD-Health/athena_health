module AthenaHealth
  class PracticeCollection < BaseCollection
    attribute :practiceinfo, Array[Practice]

    alias_method :practices, :practiceinfo
  end
end
