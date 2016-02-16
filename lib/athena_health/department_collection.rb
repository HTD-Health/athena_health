module AthenaHealth
  class DepartmentCollection < BaseCollection
    attribute :departments, Array[Department]
  end
end
