class Bid < ApplicationRecord
  validates :price, numericality: true
  belongs_to :user
  belongs_to :auction_item
  # validates :auction_item_id, uniqueness: { scope: :user_id,
  #                                           message: "You can only make one bid" }
end
