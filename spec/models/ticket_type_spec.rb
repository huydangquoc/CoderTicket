require 'rails_helper'

RSpec.describe TicketType, type: :model do
  context "multiple tickets with different price" do
    it "handle one ticket case" do
    end

    it "handle duplications" do
      event = Event.new(name: "asd")
      event.save validate: false
      type1 = event.ticket_types.create! price: 1.00
      type2 = event.ticket_types.create price: 1.00
      expect(type2.errors).to eq ""
    end
  end
end
