FactoryBot.define do
  factory :purchase_address do
    postal_code   { '123-4567' }
    prefecture_id { '1' }
    city          { Faker::Address.city }
    house_number  { Faker::Address.street_address }
    building_name { Faker::Address.street_name }
    phone_number  { Faker::Number.number(digits: 11) }
    token         { 'abc' }
  end
end

