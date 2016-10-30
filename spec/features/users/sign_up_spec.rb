# Feature spec
# http://www.relishapp.com/rspec/rspec-rails/v/3-5/docs/feature-specs/feature-spec
#
# Capybara
# http://www.rubydoc.info/github/jnicklas/capybara/master
# https://github.com/jnicklas/capybara#using-capybara-with-rspec

require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "User can sign up with name, email and password" do
    sign_up_account

    expect(page).to have_content "Account created."
  end

  scenario "User leave blank name" do
    visit new_user_path
    fill_in('Email', :with => 'huy@dang')
    fill_in('Password', :with => '123')
    fill_in('Password confirmation', :with => '123')
    click_on "Create Account"

    expect(page).to have_content "Name can't be blank"
  end

  scenario "User leave blank email" do
    visit new_user_path
    fill_in('Name', :with => 'Dang Quoc Huy')
    fill_in('Password', :with => '123')
    fill_in('Password confirmation', :with => '123')
    click_on "Create Account"

    expect(page).to have_content "Email can't be blank"
  end

  scenario "User leave blank password" do
    visit new_user_path
    fill_in('Name', :with => 'Dang Quoc Huy')
    fill_in('Email', :with => 'huy@dang')
    click_on "Create Account"

    expect(page).to have_content "Password can't be blank"
  end

  scenario "re-type password mismatch" do
    visit new_user_path
    fill_in('Name', :with => 'Dang Quoc Huy')
    fill_in('Email', :with => 'huy@dang')
    fill_in('Password', :with => '123')
    fill_in('Password confirmation', :with => '321')
    click_on "Create Account"

    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario "existed account" do
    sign_up_account
    click_on "Log Out"
    click_on "Sign Up"
    sign_up_account

    expect(page).to have_content "Email has already been taken"
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
