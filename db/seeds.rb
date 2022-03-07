require "open-uri"
require 'json'

# puts "Deleting database"

# AuctionItem.destroy_all
# Artwork.destroy_all
# Auction.destroy_all
# User.destroy_all

puts "Creating users"

user_1 = User.create!(first_name: "Josh", last_name: "Merrill", email: "josh@lewagon.com", password: 123456)
user_2 = User.create!(first_name: "John", last_name: "Doe", email: "john1@gmail.com", password: 123456)
user_3 = User.create!(first_name: 'Pablo', last_name: 'Picasso', email: 'pablo@gmail.com', password: 123456)

puts "Generating Artworks..."

file_1 = URI.open("https://res.cloudinary.com/dmty5wfjh/image/upload/v1645563638/pexels-steve-johnson-3189607_wf13kl.jpg")
artwork_1 = Artwork.create(title: Faker::Music.album, price: rand(500..1000), buyer: User.all.sample, description: Faker::Fantasy::Tolkien.poem, artist: User.all.sample)
artwork_1.photo.attach(io: file_1, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_1.save

file_2= URI.open("http://zet.gallery/blog/wp-content/uploads/2016/02/Vicent-Van-Gogh-Starry-Night-Famous-Oil-Paintings-www.shairart.com_.jpg")
artwork_2= Artwork.create(title: Faker::Music.album, price: rand(500..1000), buyer: User.all.sample, description: Faker::Fantasy::Tolkien.poem, artist: User.all.sample)
artwork_2.photo.attach(io: file_2, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_2.save

file_3 = URI.open("https://image.jimcdn.com/app/cms/image/transf/none/path/sa6549607c78f5c11/image/i31f41beba573734f/version/1500387364/unmissable-paintings-in-europe-the-scream-by-edvard-munch.jpg")
artwork_3 = Artwork.create(title: Faker::Music.album, price: rand(500..1000), buyer: User.all.sample, description: Faker::Fantasy::Tolkien.poem, artist: User.all.sample)
artwork_3.photo.attach(io: file_3, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_3.save

file_4 = URI.open("https://learnodo-newtonic.com/wp-content/uploads/2013/07/Les-Demoiselles-dAvignon-Pablo-Picasso.jpg")
artwork_4 = Artwork.create(title: Faker::Music.album, price: rand(500..1000), buyer: User.all.sample, description: Faker::Fantasy::Tolkien.poem, artist: User.all.sample)
artwork_4.photo.attach(io: file_4, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_4.save

file_5 = URI.open("https://learnodo-newtonic.com/wp-content/uploads/2014/08/The-Birth-of-Venus-1486-Botticelli.jpg")
artwork_5 = Artwork.create(title: Faker::Music.album, price: rand(500..1000), buyer: User.all.sample, description: Faker::Fantasy::Tolkien.poem, artist: User.all.sample)
artwork_5.photo.attach(io: file_5, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_5.save

file_6 = URI.open("https://learnodo-newtonic.com/wp-content/uploads/2015/01/Girl-with-a-Pearl-Earring-1665-Johannes-Vermeer.jpg")
artwork_6 = Artwork.create(title: Faker::Music.album, price: rand(500..1000), buyer: User.all.sample, description: Faker::Fantasy::Tolkien.poem, artist: User.all.sample)
artwork_6.photo.attach(io: file_6, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_6.save

file_7 = URI.open("https://learnodo-newtonic.com/wp-content/uploads/2013/07/Las-Meninas-by-Velazquez.jpg")
artwork_7 = Artwork.create(title: Faker::Music.album, price: rand(500..1000), buyer: User.all.sample, description: Faker::Fantasy::Tolkien.poem, artist: User.all.sample)
artwork_7.photo.attach(io: file_7, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_7.save

file_8 = URI.open("https://learnodo-newtonic.com/wp-content/uploads/2013/07/The-Scream-Edvard-Munch.jpg")
artwork_8 = Artwork.create(title: Faker::Music.album, price: rand(500..1000), buyer: User.all.sample, description: Faker::Fantasy::Tolkien.poem, artist: User.all.sample)
artwork_8.photo.attach(io: file_8, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_8.save

file_9 = URI.open("https://learnodo-newtonic.com/wp-content/uploads/2014/08/The-Creation-of-Adam-1512-Michelangelo.jpg")
artwork_9 = Artwork.create(title: Faker::Music.album, price: rand(500..1000), buyer: User.all.sample, description: Faker::Fantasy::Tolkien.poem, artist: User.all.sample)
artwork_9.photo.attach(io: file_9, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_9.save

file_10 = URI.open("https://learnodo-newtonic.com/wp-content/uploads/2013/07/Mona-Lisa.jpg")
artwork_10 = Artwork.create(title: Faker::Music.album, price: rand(500..1000), buyer: User.all.sample, description: Faker::Fantasy::Tolkien.poem, artist: User.all.sample)
artwork_10.photo.attach(io: file_10, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_10.save

auction_1 = Auction.create(description: "test", title: Faker::Book.title, address: "123 Main street", user: user_1, date: '2022-03-15', status: true, start_time: '2022-03-15 11:00:00', end_time: '2022-03-15 12:00:00')
auction_2 = Auction.create(description: "test", title: Faker::Book.title, address: "123 Main street", user: user_1, date: '2022-03-15', status: true, start_time: '2022-03-15 11:00:00', end_time: '2022-03-15 12:00:00')

auction_item_1 = AuctionItem.create(artwork: artwork_1, auction: auction_1)
auction_item_2 = AuctionItem.create(artwork: artwork_2, auction: auction_1)
auction_item_3 = AuctionItem.create(artwork: artwork_3, auction: auction_1)
auction_item_4 = AuctionItem.create(artwork: artwork_4, auction: auction_1)
auction_item_5 = AuctionItem.create(artwork: artwork_5, auction: auction_1)
auction_item_6 = AuctionItem.create(artwork: artwork_6, auction: auction_2)
auction_item_7 = AuctionItem.create(artwork: artwork_7, auction: auction_2)
auction_item_8 = AuctionItem.create(artwork: artwork_8, auction: auction_2)
auction_item_9 = AuctionItem.create(artwork: artwork_9, auction: auction_2)
auction_item_10 = AuctionItem.create(artwork: artwork_10, auction: auction_2)

puts "#{User.count} users and #{Artwork.count} artworks have been created, #{Auction.count} auctions have been created #{AuctionItem.count} auction items created"
