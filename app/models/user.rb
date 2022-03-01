class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :artworks_as_artist, class_name: "Artwork", foreign_key: :artist_id
  has_many :artworks_as_buyer, class_name: "Artwork", foreign_key: :buyer_id
end
