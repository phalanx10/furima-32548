FactoryBot.define do
  factory :user do
    nickname { 'test1' }
    email { '1test@test.com' }
    password { 'test123' }
    password_confirmation { 'test123' }
    family_name { '山田' }
    first_name { '隆太郎' }
    family_name_kana { 'ヤマダ' }
    first_name_kana { 'リクタロウ' }
    birthday { '2000-01-01' }
  end
end
