class Link < ApplicationRecord
    validates_presence_of :original_url
    validates :original_url, format: URI::regexp(%w[http https])
    validates_uniqueness_of :shorten_url
    validates_length_of :original_url, within: 3..255, on: :create, message: "too long"
    validates_length_of :shorten_url, within: 3..255, on: :create, message: "too long"
  
    def self.generate_shorten_url(original_url,base_url)
        shorten_url = base_url+ "/" + SecureRandom.uuid[0..5] 
    end
end
