class AddressRecord
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :address, :building_name, :phone_number, :purchase_record_id, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
  end
end

def save
  destination_address = DestinationAddress.create(post_code: post_code, prefecture: prefecture, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  purchase_record = PurchaseRecord.create(user_id: user.id, item_id: item.id)
end