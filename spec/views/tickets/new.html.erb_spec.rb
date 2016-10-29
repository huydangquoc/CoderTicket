# View specs
# http://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/view-specs

require 'rails_helper'

RSpec.describe "tickets/new", type: :view do
  context "placing ticket" do
    before do
      @event = FactoryGirl.build(:event, :upcoming, name: "Event Name")
      EventHelpers.create(@event)
    end

    it "displays 3 columns" do
      render

      expect(rendered).to include "Ticket Type"
      expect(rendered).to include "Unit Price"
      expect(rendered).to include "Quantity"
    end

    it "displays BUY button" do
      render

      expect(rendered).to have_button("Buy")
    end

  end
end
