FactoryBot.define do
  factory :user do
    family_name { '鈴木' }
    first_name { '太郎' }
    read_family { 'スズキ' }
    read_first { 'タロウ' }
    nickname { 'suzuki' }
    birthday { '19801124' }
    email { 'test@example' }
    password { 'test1234' }
    password_confirmation { password }
  end
end
