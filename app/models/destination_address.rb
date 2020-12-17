class DestinationAddress < ApplicationRecord
  belongs_to :purchase_record

  with_options presence: true do
    validates :post_code
    validates :city
    validates :address
    validates :phone_number
  end
  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
end
