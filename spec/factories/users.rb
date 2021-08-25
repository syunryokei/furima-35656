FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
      family_name { person.last.kanji }
      first_name { person.first.kanji }
      read_family { person.last.katakana }
      read_first { person.first.katakana }
      nickname { Faker::Name.name }
      birthday { Faker::Date.backward }
      email { Faker::Internet.free_email }
      password { '123abc' }
      password_confirmation { password }
  end
end
