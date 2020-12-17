class PurchaseRecord < ApplicationRecord
  has_one :destination_address
  belongs_to :item
  belongs_to :user
end
