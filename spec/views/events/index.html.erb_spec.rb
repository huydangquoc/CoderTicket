# View specs
# http://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/view-specs

require 'rails_helper'

RSpec.describe "events/index", type: :view do

  context "with 2 events" do
    before do
      @event1 = FactoryGirl.build(:event, :upcoming, name: "Event 1")
      @event2 = FactoryGirl.build(:event, :past_event, name: "Event 2")
      EventHelpers.create_list([@event1, @event2])
      # assign
      assign(:events, [@event1, @event2])
    end

    it "displays upcoming event" do
      render

      expect(rendered).to include "Event 1"
    end

    # code logic choose what to show is in controller, view only take part in show it correctly
    it "displays past event" do
      render

      expect(rendered).to include "Event 2"
    end

    it "displays both events" do
      render

      expect(rendered).to include "Event 1"
      expect(rendered).to include "Event 2"
    end

  end
end
