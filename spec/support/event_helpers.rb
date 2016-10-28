module EventHelpers

  def self.create(event)
    event.category = CategoryHelpers.get_or_create
    event.venue = VenueHelpers.get_or_create event.name
    event.save!
  end

  def self.create_list(events)
    created_events = Array.new
    events.each do |event|
      created_events << self.create(event)
    end
  end

end

RSpec.configure do |config|
  config.include EventHelpers
end
