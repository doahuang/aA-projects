# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(username: 'Qi')
user2 = User.create!(username: 'Alfred')
user3 = User.create!(username: 'Name 3')

art1 = Artwork.create!(title: 'Art 1', image_url: 'pic1.com', artist_id: user1.id)
art2 = Artwork.create!(title: 'Art 2', image_url: 'pic2.com', artist_id: user2.id)
art3 = Artwork.create!(title: 'Art 3', image_url: 'pic3.com', artist_id: user3.id)

ArtworkShare.create!(viewer_id: user1.id, artwork_id: art1.id)
ArtworkShare.create!(viewer_id: user2.id, artwork_id: art1.id)
ArtworkShare.create!(viewer_id: user1.id, artwork_id: art2.id)
ArtworkShare.create!(viewer_id: user3.id, artwork_id: art2.id)
ArtworkShare.create!(viewer_id: user2.id, artwork_id: art3.id)
