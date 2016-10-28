# View specs
# http://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/view-specs

require 'rails_helper'

RSpec.describe "events/index", type: :view do

  context "with 2 events" do
    before do
      event1 = FactoryGirl.build(:event, :upcoming, name: "Event 1")
      event2 = FactoryGirl.build(:event, :past_event, name: "Event 2")
      event3 = FactoryGirl.build(:event, :past_event, name: "Event 3")
      EventHelpers.create_list([event1, event2, event3])
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
