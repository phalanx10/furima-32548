class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
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
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input full-width characters.' }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
    validates :image
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :status_id
    validates :delivery_day_id
    validates :shipping_area_id
    validates :delivery_fee_id
    validates :category_id
  end
end
