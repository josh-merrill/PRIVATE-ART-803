class AuctionItem < ApplicationRecord
  belongs_to :artwork
  belongs_to :auction
  has_many :bids, dependent: :destroy
end
