module AthenaHealth
  class Subscription < BaseModel
    attribute :status,        String
    attribute :subscriptions, Array[Hash]

    def events
      @events ||= subscriptions.map{|s| s["eventname"]}
    end

    def active?
      @active || status === 'ACTIVE'
    end
  end
end
