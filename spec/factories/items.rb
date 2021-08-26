FactoryBot.define do
  factory :item do
    product_name { Faker::Commerce.brand }
    product_info { Faker::Base.regexify('[あいうえおかきくけこ]{26}') }
    category_id { Faker::Number.between(from: 2, to: 14) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    postage_type_id { Faker::Number.between(from: 2, to: 3) }
    prefectures_id { Faker::Number.between(from: 2, to: 48) }
    delivery_days_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
