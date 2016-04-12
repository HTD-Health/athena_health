module AthenaHealth
  class DocumentCollection < BaseCollection
    attribute :documents, Array[Document]
  end
end
