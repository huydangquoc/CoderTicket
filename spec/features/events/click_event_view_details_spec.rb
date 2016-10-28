# Feature spec
# http://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/feature-specs/feature-spec
#
# Capybara
# http://www.rubydoc.info/github/jnicklas/capybara/master
# https://github.com/jnicklas/capybara#using-capybara-with-rspec

require 'rails_helper'

RSpec.feature "Click event will see event details", type: :feature do

  before do
    # init category object
    @category = FactoryGirl.create(:category)
    # create events
    event1 = EventHelpers.event_creator("Event 1", "upcoming", @category)
    event2 = EventHelpers.event_creator("Event 2", "upcoming", @category)
  end

  scenario "User click an event in homepage" do
    visit "/"
    click_on "Event 2"

    expect(page).to have_content "Hot Events"
  end
end


# require "rails_helper"

# RSpec.feature "Widget management", :type => :feature do
#   scenario "User creates a new widget" do
#     visit "/widgets/new"

#     fill_in "Name", :with => "My Widget"
#     click_button "Create Widget"

#     expect(page).to have_text("Widget was successfully created.")
#   end
# end
