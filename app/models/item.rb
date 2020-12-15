class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :shipping_area

  with_options presence: true do
    validates :item_name
    validates :description
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}, format: { with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Input full-width characters."}
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :delivery_days_id
    validates :Shipping_area_id
    validates :delivery_fee_id
    validates :categories_id
  end
end
