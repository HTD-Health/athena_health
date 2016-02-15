module AthenaHealth
  class PracticeCollection
    include Virtus.model

    attribute :totalcount,   Integer
    attribute :practiceinfo, Array[Practice]
  end
end
