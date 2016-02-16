module AthenaHealth
  class Balance < BaseModel
    attribute :balance,         Integer
    attribute :departmentlist,  String
    attribute :providergroupid, Integer
    attribute :cleanbalance,    Boolean
  end
end
