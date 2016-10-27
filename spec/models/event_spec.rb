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

    before do
      # init category object
      @category = FactoryGirl.create(:category)
    end

    it "return 0 upcoming event" do
      # https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md

      EventHelpers.event_creator("Event 1", "past_event", @category)
      EventHelpers.event_creator("Event 2", "past_event", @category)
      EventHelpers.event_creator("Event 3", "past_event", @category)

      expect(Event.upcoming).to eq []
    end

    it "return 1 upcoming event" do
      EventHelpers.event_creator("Event 1", "upcoming", @category)
      EventHelpers.event_creator("Event 2", "past_event", @category)
      EventHelpers.event_creator("Event 3", "past_event", @category)

      expect(Event.upcoming.count).to eq 1
    end

    it "return 3 upcoming event" do
      EventHelpers.event_creator("Event 1", "upcoming", @category)
      EventHelpers.event_creator("Event 2", "upcoming", @category)
      EventHelpers.event_creator("Event 3", "upcoming", @category)

      expect(Event.upcoming.count).to eq 3
    end

  end

end
