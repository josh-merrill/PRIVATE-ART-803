class Artwork < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :price, numericality: true
  belongs_to :artist, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_many :auction_items
  has_one_attached :photo
  validates :photo, presence: true
end
