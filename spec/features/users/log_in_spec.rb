# Feature spec
# http://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/feature-specs/feature-spec
#
# Capybara
# http://www.rubydoc.info/github/jnicklas/capybara/master
# https://github.com/jnicklas/capybara#using-capybara-with-rspec

require 'rails_helper'

RSpec.feature "Log In", type: :feature do
  scenario "User can login with valid account info" do
    sign_up_account
    click_on "Log Out"
    click_on "Log In"
    fill_in('Email', :with => 'huy@dang')
    fill_in('Password', :with => '123')
    click_on "Submit"

    expect(page).to have_content "Welcome back"
  end

  def sign_up_account
    visit new_user_path
    fill_in('Name', :with => 'Dang Quoc Huy')
    fill_in('Email', :with => 'huy@dang')
    fill_in('Password', :with => '123')
    fill_in('Password confirmation', :with => '123')
    click_on "Create Account"
  end

end
