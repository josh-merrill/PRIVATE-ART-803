class AuctionItem < ApplicationRecord
  belongs_to :artwork # validate using the schema since bids
  # can change the final price of the artwork
  belongs_to :auction
  has_many :bids, dependent: :destroy
end
