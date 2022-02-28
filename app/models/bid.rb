class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :auction_item
end
