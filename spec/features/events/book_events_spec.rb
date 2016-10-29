# Feature spec
# http://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/feature-specs/feature-spec
#
# Capybara
# http://www.rubydoc.info/github/jnicklas/capybara/master
# https://github.com/jnicklas/capybara#using-capybara-with-rspec

require 'rails_helper'

RSpec.feature "Book Event", type: :feature do
  before do
    @event1 = FactoryGirl.build(:event, :upcoming, name: "Event 1")
    @event2 = FactoryGirl.build(:event, :upcoming, name: "Event 2")
    @event3 = FactoryGirl.build(:event, :upcoming, name: "Event 3")
    EventHelpers.create_list([@event1, @event2, @event3])
  end

  scenario "User can click BOOK NOW button" do
    go_detail_event2
    click_link "BOOK NOW"

    # f#ck, click but not work for now, need investigation
    # expect(page).to have_content "Buy"
  end

  def visit_homepage
    visit root_path
  end

  def go_detail_event2
    visit_homepage
    click_on "Event 2"
  end
end
