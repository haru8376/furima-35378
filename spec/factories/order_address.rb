FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    prefecture_id { 1 }
    city          { '福岡市' }
    house_number  { '1-2' }
    building_name { '福岡ビル' }
    phone_number  { '1234567890' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
