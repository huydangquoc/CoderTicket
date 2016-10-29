module EventHelpers

  def self.create(event)
    event.category = CategoryHelpers.get_or_create
    event.venue = VenueHelpers.get_or_create event.name
    event.save!
  end

  def self.create_with_tickets(event)
    event.category = CategoryHelpers.get_or_create
    event.venue = VenueHelpers.get_or_create event.name
    FactoryGirl.create(:ticket_type, event: event)
    FactoryGirl.create(:ticket_vip, event: event)
    FactoryGirl.create(:ticket_eco, event: event)
    FactoryGirl.create(:ticket_free, event: event)
    event.save!
  end

  def self.create_list(events)
    events.each do |event|
      self.create(event)
    end
  end
end

RSpec.configure do |config|
  config.include EventHelpers
end
