# Getting Started
# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md

FactoryGirl.define do
  factory :venue do
    name { "#{Random.rand(1...1000)}" }
  end
end
