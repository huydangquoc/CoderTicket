require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { event = Event.new }

  describe "#venue_name" do
    it "returns nil if there's no venue" do
      expect(event.venue_name).to be_nil
    end

    it "returns venue's name if there's a venue" do
      event.venue = Venue.new(name: "RMIT")
      expect(event.venue_name).to eq "RMIT"
    end
  end

  describe ".upcoming" do
    it "return 0 upcoming event" do
      # https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
      event1 = FactoryGirl.build(:event, :past_event, name: "Event 1")
      event2 = FactoryGirl.build(:event, :past_event, name: "Event 2")
      event3 = FactoryGirl.build(:event, :past_event, name: "Event 3")
      EventHelpers.create_list([event1, event2, event3])

      expect(Event.upcoming).to eq []
    end

    it "return 1 upcoming event" do
      event1 = FactoryGirl.build(:event, :upcoming, name: "Event 1")
      event2 = FactoryGirl.build(:event, :past_event, name: "Event 2")
      event3 = FactoryGirl.build(:event, :past_event, name: "Event 3")
      EventHelpers.create_list([event1, event2, event3])

      expect(Event.upcoming.count).to eq 1
    end

    it "return 3 upcoming event" do
      event1 = FactoryGirl.build(:event, :upcoming, name: "Event 1")
      event2 = FactoryGirl.build(:event, :upcoming, name: "Event 2")
      event3 = FactoryGirl.build(:event, :upcoming, name: "Event 3")
      EventHelpers.create_list([event1, event2, event3])

      expect(Event.upcoming.count).to eq 3
    end
  end
end
