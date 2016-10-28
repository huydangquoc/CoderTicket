# View specs
# http://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/view-specs

require 'rails_helper'

RSpec.describe "events/index", type: :view do

  context "with 2 events" do

    before do
      # init category object
      @category = FactoryGirl.create(:category)
      # create events
      event1 = EventHelpers.event_creator("Event 1", "upcoming", @category)
      event2 = EventHelpers.event_creator("Event 2", "upcoming", @category)
      # assign
      assign(:events, [event1, event2])
    end

    it "displays both widgets" do
      render

      expect(rendered).to match /Event 1/
      expect(rendered).to match /Event 2/
    end

  end
end
