class Bid < ApplicationRecord
  validates :price, numericality: true
  belongs_to :user
  belongs_to :auction_item
end
