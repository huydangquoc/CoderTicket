# Feature spec
# http://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/feature-specs/feature-spec
#
# Capybara
# http://www.rubydoc.info/github/jnicklas/capybara/master
# https://github.com/jnicklas/capybara#using-capybara-with-rspec

require 'rails_helper'

RSpec.feature "Click event will see event details", type: :feature do
  before do
    @event1 = FactoryGirl.build(:event, :upcoming, name: "Event 1")
    @event2 = FactoryGirl.build(:event, :upcoming, name: "Event 2")
    @event3 = FactoryGirl.build(:event, :upcoming, name: "Event 3")
    EventHelpers.create_list([@event1, @event2, @event3])
  end

  scenario "User click an event in homepage" do
    visit "/"
    click_on "Event 2"

    expect(page).to have_content "Hot Events"
  end
end
