# Getting Started
# https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md

FactoryGirl.define do
  factory :ticket_type do
    name "Normal"
    price 500000
    max_quantity 100

    factory :ticket_vip do
      name "VIP"
      price 999000
      max_quantity 15
    end

    factory :ticket_eco do
      name "Economic"
      price 299000
      max_quantity 20
    end

    factory :ticket_free do
      name "Free"
      price 0
      max_quantity 5
    end
  end
end
