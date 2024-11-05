namespace :dev do
  desc "Reset database"
  task reset: :environment do

    if Rails.env.development?
      show_spinner("Dropping DB...") {%x(rails db:drop)}
    
      show_spinner("Creating DB...") {%x(rails db:create)}

      show_spinner("Migrating DB...") {%x(rails db:migrate)}
      
      %x(rails dev:add_mining_types)

      %x(rails dev:add_currencies)

    else
      puts "Not on the development environment!"
    end
  end

  desc "Register the cryptocurrencies"
  task add_currencies: :environment do
    show_spinner("Registering Currencies...") do
      coins =  [
          {
              description: "Bitcoin",
              acronym: "BTC",
              url_image: "https://pngimg.com/uploads/bitcoin/bitcoin_PNG7.png",
              mining_type: MiningType.find_by(acronym: 'PoW')
          },

          {
              description: "Ethereum",
              acronym: "ETH",
              url_image: "https://upload.wikimedia.org/wikipedia/commons/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png",
              mining_type: MiningType.find_by(acronym: 'PoW')
          },

          {
              description: "Dogecoin",
              acronym: "DOGE",
              url_image: "https://cryptologos.cc/logos/dogecoin-doge-logo.png",
              mining_type: MiningType.find_by(acronym: 'PoW')
          },
          
          {
              description: "Cardano",
              acronym: "ADA",
              url_image: "https://cryptologos.cc/logos/cardano-ada-logo.png",
              mining_type: MiningType.find_by(acronym: 'PoS')
          },

          {
              description: "Solana",
              acronym: "SOL",
              url_image: "https://cryptologos.cc/logos/solana-sol-logo.png",
              mining_type: MiningType.all.sample
          }
      ]

      coins.each do | coin|
          Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Register the mining types"
  task add_mining_types: :environment do
    show_spinner("Registering mining types...")do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"}
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end


  private

  def show_spinner(start_text)
    spinner = TTY::Spinner.new("[:spinner] #{start_text}")
    spinner.auto_spin
    yield
    spinner.success("(Successful!)")
  end

end