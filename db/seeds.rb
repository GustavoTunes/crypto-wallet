# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Registering Currencies..."

Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://pngimg.com/uploads/bitcoin/bitcoin_PNG7.png"
)

Coin.create!(
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://upload.wikimedia.org/wikipedia/commons/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png"
)

Coin.create!(
    description: "Dogecoin",
    acronym: "DOGE",
    url_image: "https://cryptologos.cc/logos/dogecoin-doge-logo.png"
)

puts "Currencies registered successfully!"