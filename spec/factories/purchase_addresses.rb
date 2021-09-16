FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefectures_id { 47 }
    city { '南風原町' }
    address { '999-9' }
    building_name { 'フォートナイト1203' }
    phone_number { 010-0200-0300 }
    token { "tok_abcdefghijk00000000000000000" }
    association :user
  end
end
