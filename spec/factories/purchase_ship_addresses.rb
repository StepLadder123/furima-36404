FactoryBot.define do
  factory :purchase_ship_address do
    postal_code { '123-4567'}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {'新宿区'}
    address {'新宿1-1'}
    build_name {'新宿ビル12F'}
    phone_number {'0123456789'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
