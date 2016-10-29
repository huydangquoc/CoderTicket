# Getting Started
# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md

FactoryGirl.define do
  factory :event do
    name "Event Name"
    extended_html_description <<-DESC
    <h1>This is event description</h1>
    DESC
    starts_at { Time.now }

    # # not work for now, need to investigate
    # factory :event_with_tickets do
    #   after(:create) do |event|
    #     create(:ticket_type, event: event)
    #     create(:ticket_vip, event: event)
    #     create(:ticket_eco, event: event)
    #     create(:ticket_free, event: event)
    #   end
    # end

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
