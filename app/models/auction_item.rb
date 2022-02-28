class AuctionItem < ApplicationRecord
  belongs_to :artwork
  belongs_to :auction
end
