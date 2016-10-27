module EventHelpers

  def self.event_creator(event_name, event_trait, category)
    if event_trait == "upcoming"
      event = FactoryGirl.build(:event, :upcoming, name: "#{event_name}")
    else
      event = FactoryGirl.build(:event, :past_event, name: "#{event_name}")
    end
    event.category = category
    event.venue = FactoryGirl.create(:venue, name: event.name)
    event.save
    return event
  end

end

RSpec.configure do |config|
  config.include EventHelpers
end
