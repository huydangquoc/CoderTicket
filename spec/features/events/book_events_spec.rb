# Feature spec
# http://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/feature-specs/feature-spec
#
# Capybara
# http://www.rubydoc.info/github/jnicklas/capybara/master
# https://github.com/jnicklas/capybara#using-capybara-with-rspec

require 'rails_helper'

RSpec.feature "Book Event", type: :feature do

  before do
    # init category object
    @category = FactoryGirl.create(:category)
    # create events
    event1 = EventHelpers.event_creator("Event 1", "upcoming", @category)
    event2 = EventHelpers.event_creator("Event 2", "upcoming", @category)
  end

  scenario "User can click BOOK NOW button" do
    go_detail_event2
    click_link "BOOK NOW"

    expect(page).to have_content "Buy"
  end

  def visit_homepage
    visit root_path
  end

  def go_detail_event2
    visit_homepage
    click_on "Event 2"
  end
end
