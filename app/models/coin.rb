class Coin < ApplicationRecord
    belongs_to :mining_type 

    validates :url_image, format: { 
        with: /\A(?:https?:\/\/)?(?:[a-z0-9\-]+\.)+[a-z]{2,6}(?:\/[^\s]*)?\.(?:png|jpe?g)\z/i, 
        message: :url_image
    }, allow_blank: true
end
