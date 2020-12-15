FactoryBot.define do
  factory :item do
    item_name {'dd'}
    description {'dd'}
    price {'300'}
    status_id { 3 }
    delivery_days_id { 3 }
    shipping_area_id { 3 }
    delivery_fee_id { 3 }
    categories_id { 3 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
