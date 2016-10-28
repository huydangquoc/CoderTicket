# Getting Started
# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md

FactoryGirl.define do
  factory :event do
    name "Event Name"
    extended_html_description <<-DESC
    <h1>This is event description</h1>
    DESC
    starts_at { Time.now }

    trait :upcoming do
      # Action View Date Helpers
      # http://api.rubyonrails.org/classes/ActionView/Helpers/DateHelper.html
      starts_at { 2.days.from_now }
    end

    trait :past_event do
      starts_at { 2.days.ago }
    end
  end
end
