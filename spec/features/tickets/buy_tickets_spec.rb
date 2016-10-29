# Feature spec
# http://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/feature-specs/feature-spec
#
# Capybara
# http://www.rubydoc.info/github/jnicklas/capybara/master
# https://github.com/jnicklas/capybara#using-capybara-with-rspec

require 'rails_helper'

RSpec.feature "Buy Tickets", type: :feature do
  before do
    @event = FactoryGirl.build(:event, :upcoming, name: "Very Kool Event")
    EventHelpers.create_with_tickets(@event)
  end

  scenario "User clicks `Buy` without select ticket type and quantity" do
    prepare_to_ticket_new
    click_button "Buy"

    expect(page).to have_content "Seriously? You choose to buy nothing."
  end

  scenario "User buy more than 10 tickets of a kind" do
    prepare_to_ticket_new
    # test input wrong
    begin
      select('15', :from => "quantity_#{@event.ticket_types[0].id}")
    rescue
      raised_error = true
    end
    # process result
    if raised_error
      expect(1).to eq 1
    else
      expect(1).to eq 0
    end
  end

  scenario "User buy more than number of available ticket" do
    prepare_to_ticket_new
    select('10', :from => "quantity_#{@event.ticket_types[3].id}")
    click_button "Buy"

    expect(page).to have_content "You can't buy more than number of available tickets."
  end

  scenario "User can buy many tickets of many types" do
    prepare_to_ticket_new
    @event.ticket_types.each do |type|
      select('5', :from => "quantity_#{type.id}")
    end
    click_button "Buy"

    expect(page).to have_content "Your order is created successfully."
  end

  def prepare_to_ticket_new
    visit root_path
    click_on @event.name
    click_link "BOOK NOW"
  end
end
