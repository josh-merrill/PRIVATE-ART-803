class Auction < ApplicationRecord
  validates :description, presence: true
  validates :address, presence: true
  validates :date, presence: true
  validates :status, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  has_many :auction_items, dependent: :destroy
  has_many :artworks, through: :auction_items
  belongs_to :user
end
