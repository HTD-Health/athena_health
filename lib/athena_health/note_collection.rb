module AthenaHealth
  class NoteCollection < BaseCollection
    attribute :notes, Array[Note]
  end
end
