require 'rails_helper'

RSpec.describe TicketType, type: :model do
  context "multiple tickets with different price" do
    it "handle one ticket case" do
      event = FactoryGirl.build(:event, :past_event, name: "Event")
      EventHelpers.create(event)
      event.ticket_types.create price: 1.00
      expect(event.ticket_types.length).to eq 1
    end

    it "handle duplications" do
      event = Event.new(name: "asd")
      event.save validate: false
      type1 = event.ticket_types.create! price: 1.00
      type2 = event.ticket_types.create price: 1.00
      expect(type2.errors.full_messages.to_sentence).to match "Cannot have duplicates"
    end
  end
end
