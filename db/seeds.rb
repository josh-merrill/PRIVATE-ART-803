# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AuctionItem.delete_all
Artwork.delete_all
Auction.delete_all
User.delete_all


user_1 = User.create!(first_name: "Jane", last_name: "Doe", email: "jane1@gmail.com", password: 123456)
user_2 = User.create!(first_name: "John", last_name: "Doe", email: "john1@gmail.com", password: 123456)

artwork_1 = Artwork.create(title: 'Mona Lisa', price: 100, buyer: user_1, description: 'Beautiful', artist: user_1)
artwork_2 = Artwork.create(title: 'Starry night', price: 200, buyer: user_2, description: 'Really beautiful', artist: user_1)
auction_1 = Auction.create(description: "test", address: "123 Main street", user: user_1, date: '2022-03-15', status: true, start_time: '2022-03-15 11:00:00', end_time: '2022-03-15 12:00:00')
auction_item_1 = AuctionItem.create(artwork: artwork_1, auction: auction_1)

puts "#{User.count} users and #{Artwork.count} artworks have been created, #{Auction.count} auctions have been created #{AuctionItem.count} auction items created"
