FactoryBot.define do
  factory :item do
    name             {Faker::Name.name}
    info             {Faker::Lorem.sentence}
    category_id      {Faker::Number.between(from: 2, to: 10)}
    status_id        {Faker::Number.between(from: 2, to: 7)}
    ship_fee_id      {Faker::Number.between(from: 2, to: 3)}
    ship_area_id     {Faker::Number.between(from: 2, to: 48)}
    ship_schedule_id {Faker::Number.between(from: 2, to: 4)}
    price            {Faker::Number.between(from: 300, to: 9999999)}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end