require "open-uri"
require 'json'
require 'faker'

puts "Deleting database"

Bid.destroy_all
AuctionItem.destroy_all
Artwork.destroy_all
Auction.destroy_all
User.destroy_all

puts "Creating users..."

user_0 = User.create!(first_name: "Admin", last_name: "Admin", email: "hello@artcollective.com", password: 123456)
user_1 = User.create!(first_name: "Frida", last_name: "Kahlo", email: "frida@gmail.com", password: 123456)
user_2 = User.create!(first_name: "Georgia", last_name: "O'Keeffe", email: "georgia@gmail.com", password: 123456)
user_3 = User.create!(first_name: 'Edvard', last_name: 'Munch', email: 'jean@gmail.com', password: 123456)
user_4 = User.create!(first_name: 'Alan', last_name: 'Paint', email: 'pablo@gmail.com', password: 123456)
user_5 = User.create!(first_name: 'Vincent', last_name: 'van Gogh', email: 'vincent@gmail.com', password: 123456)

puts "GENERATING ARTWORKS..."


puts "Generating Frida Kahlo artworks..."

file_1 = URI.open("https://www.fridakahlo.org/images/paintings/the-wounded-deer.jpg")
artwork_1 = Artwork.create(title: "The Wounded Deer, 1946 by Frida Kahlo", price: rand(500..1000), buyer: User.all.sample, description: "In this painting, Frida used a young deer with the head of herself and was fatally wounded by a bunch of arrows. The background is the forest with dead trees and broken branches, which implied the feeling of fear and desperation. Far away is the stormy, lightning-lit sky which brings some hope but the dear will never be able to reach it.", artist: user_1)
artwork_1.photo.attach(io: file_1, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_1.save

file_2 = URI.open("https://www.fridakahlo.org/images/paintings/the-two-fridas.jpg")
artwork_2 = Artwork.create(title: "The Two Fridas, 1939 by Frida Kahlo", price: rand(500..1000), buyer: User.all.sample, description: "This painting was completed shortly after her divorce with Diego Rivera. This portrait shows Frida's two different personalities. One is the traditional Frida in Tehuana costume, with a broken heart, sitting next to an independent, modern dressed Frida. In Frida's diary, she wrote about this painting and said it is originated from her memory of an imaginary childhood friend. Later she admitted it expressed her desperation and loneliness with the separation from Diego.", artist: user_1)
artwork_2.photo.attach(io: file_2, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_2.save

file_3 = URI.open("https://www.fridakahlo.org/images/paintings/self-portrait-with-necklace-of-thorns.jpg")
artwork_3 = Artwork.create(title: "Self-Portrait with Thorn Necklace and Hummingbird, 1940", price: rand(500..1000), buyer: User.all.sample, description: "Self-Portrait with Thorn Necklace and Hummingbird, was painted by Frida Kahlo in 1940. Although this painting has a small size (about 16x24), it draws lots of interest, since it contains so many aspects which are symbolic to Frida Kahlo. In this portrait, Frida Kahlo faces the viewer with a background of large green leaves and a yellow leaf right behind her.", artist: user_1)
artwork_3.photo.attach(io: file_3, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_3.save


puts "Generating Georgia O'Keeffe artworks..."

file_4 = URI.open("https://prints.okeeffemuseum.org/vitruvius/render/600/463188.jpg")
artwork_4 = Artwork.create(title: "Church Bell, Ward, Colorado, Georgia O'Keeffe, 1917", price: rand(500..1000), buyer: User.all.sample, description: "The central focus of this painting is the church bell situated in a small belltower at the top of a sharply-pointed church roof. The church building itself has been cropped from the image. In the middleground, several small houses and buildings dot the landscape. The background consists of heavily-wooded mountains that recede into the distance, fading into softer colors as they do so.", artist: user_2)
artwork_4.photo.attach(io: file_4, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_4.save

file_5 = URI.open("https://arthur.io/img/art/0000017344aca8891/georgia-okeeffe/the-cliff-chimneys/large-2x/georgia-okeeffe--the-cliff-chimneys.jpg")
artwork_5 = Artwork.create(title: "The Cliff Chimneys, Georgia O'Keeffe, 1938", price: rand(500..1000), buyer: User.all.sample, description: "The Cliff Chimneys (1938) by Georgia O'KeeffeMilwaukee Art Museum. Mountain. This square-top mountain is Cerro Pedernal, in northern New Mexico. Artist Georgia O'Keeffe painted it over twelve times, saying, “God told me if I painted it often enough I could have it.”", artist: user_2)
artwork_5.photo.attach(io: file_5, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_5.save

file_6 = URI.open("https://www.artfixdaily.com//images/sd/33/09/Georgia_O'Keeffe.jpg")
artwork_6 = Artwork.create(title: "Crab’s Claw Ginger Hawaii,Georgia O’Keeffe, 1939", price: rand(500..1000), buyer: User.all.sample, description: "One of the most sought-after artists today, Georgia O’Keeffe stands as a singular figure in 20th century art history. O’Keeffe’s Crab’s Claw Ginger Hawaii represents a pivotal moment in the artist’s practice, when she embarked on a nine-week sojourn to Hawaii in 1939 on a commission to create images for print advertisements by the Hawaiian Pineapple Company, now famously named Dole. ", artist: user_2)
artwork_6.photo.attach(io: file_6, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_6.save


puts "Generating Edvard Munch artworks..."

file_6 = URI.open("https://learnodo-newtonic.com/wp-content/uploads/2013/07/The-Scream-Edvard-Munch.jpg")
artwork_7 = Artwork.create(title: "The Scream, Edvard Munch, 1938", price: rand(500..1000), buyer: User.all.sample, description: "The Scream is autobiographical, an expressionistic construction based on Munch's actual experience of a scream piercing through nature while on a walk, after his two companions, seen in the background, had left him. Fitting the fact that the sound must have been heard at a time when his mind was in an abnormal state, Munch renders it in a style which if pushed to extremes can destroy human integrity.", artist: user_3)
artwork_7.photo.attach(io: file_6, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_7.save


puts "Generating other artworks..."

file_7 = URI.open("https://images.unsplash.com/photo-1531913764164-f85c52e6e654?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3734&q=80")
artwork_8 = Artwork.create(title: "The Ecstasy of Code", price: rand(500..1000), buyer: User.all.sample, description: "This artwork captures how commenting is the “art” of describing what your program is going to do in “high level” English statements.", artist: user_4)
artwork_8.photo.attach(io: file_7, filename: 'temp.jpg', content_type: 'image/jpg')
artwork_8.save

puts "Generating auction items for auction..."

file_3 = URI.open("https://www.fridakahlo.org/images/paintings/self-portrait-with-necklace-of-thorns.jpg")
auction_1 = Auction.new(description: "In these meticulously executed paintings, Kahlo portrays herself again and again, simultaneously exploring, questioning, and staging her self and identity.", title: "Frida Kahlo oil paintings on canvas", address: "Online", user: user_1, date: '2022-03-12', start_time: '2022-03-12 15:00:00', end_time: '2022-03-12 16:00:00')
auction_1.photo.attach(io: file_3, filename: 'temp.jpg', content_type: 'image/jpg')
auction_1.save

file_5 = URI.open("https://arthur.io/img/art/0000017344aca8891/georgia-okeeffe/the-cliff-chimneys/large-2x/georgia-okeeffe--the-cliff-chimneys.jpg")
auction_2 = Auction.new(description: "O'Keeffe's aesthetic legacy continues to capture the popular imagination and inspire leading designers and tastemakers of our day.", title: "Georgia O’Keeffe: Art, Image, Style", address: "Online", user: user_2, date: '2022-03-15', start_time: '2022-03-15 11:00:00', end_time: '2022-03-15 12:00:00')
auction_2.photo.attach(io: file_5, filename: 'temp.jpg', content_type: 'image/jpg')
auction_2.save

file_6 = URI.open("https://learnodo-newtonic.com/wp-content/uploads/2013/07/The-Scream-Edvard-Munch.jpg")
auction_3 = Auction.new(description: "Second only to Leonardo da Vinci’s Mona Lisa, Edvard Munch’s The Scream may be the most iconic human figure in the history of Western art.", title: "Edvard Munch's The Scream  ", address: "Online", user: user_3, date: '2022-03-15', start_time: '2022-03-16 13:00:00', end_time: '2022-03-16 14:00:00')
auction_3.photo.attach(io: file_6, filename: 'temp.jpg', content_type: 'image/jpg')
auction_3.save

file_7 = URI.open("https://images.unsplash.com/photo-1531913764164-f85c52e6e654?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3734&q=80")
auction_4 = Auction.new(description: "A timeless artwork collection that highlights the joys of modern computer programming.", title: "The Ecstasy of Code by Alan Paint", address: "Online", user: user_4, date: '2022-03-15', start_time: '2022-03-15 09:00:00', end_time: '2022-03-18 10:00:00')
auction_4.photo.attach(io: file_7, filename: 'temp.jpg', content_type: 'image/jpg')
auction_4.save


puts "Generating photos of auction items"

auction_item_1 = AuctionItem.new(artwork: artwork_1, auction: auction_1)
auction_item_1.save

auction_item_2 = AuctionItem.new(artwork: artwork_2, auction: auction_1)
auction_item_2.save

auction_item_3 = AuctionItem.new(artwork: artwork_3, auction: auction_1)
auction_item_3.save

auction_item_4 = AuctionItem.new(artwork: artwork_4, auction: auction_2)
auction_item_4.save

auction_item_5 = AuctionItem.new(artwork: artwork_5, auction: auction_2)
auction_item_5.save

auction_item_6 = AuctionItem.new(artwork: artwork_6, auction: auction_2)
auction_item_6.save

auction_item_7 = AuctionItem.new(artwork: artwork_7, auction: auction_3)
auction_item_7.save

auction_item_8 = AuctionItem.new(artwork: artwork_8, auction: auction_4)
auction_item_8.save

# auction_item_9 = AuctionItem.new(artwork: artwork_9, auction: auction_5)
# auction_item_9.save

# auction_item_10 = AuctionItem.new(artwork: artwork_10, auction: auction_3)
# auction_item_10.save

puts "#{User.count} users and #{Artwork.count} artworks have been created, #{Auction.count} auctions have been created #{AuctionItem.count} auction items created"
