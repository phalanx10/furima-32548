FactoryBot.define do
  factory :address_record do
    post_code { '123-4567' }
    prefecture { 3 }
    city { '横浜市' }
    address { '青山1-1-1' }
    building_name { 'ビル104' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end
