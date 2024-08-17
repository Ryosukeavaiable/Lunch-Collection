class Map < ApplicationRecord

belongs_to :user
  
has_one_attached :photo

  before_save :geocode_address
  
   private

  def geocode_address
    geocoded = Geocoder.search(self.address).first
    if geocoded
      self.latitude = geocoded.latitude
      self.longitude = geocoded.longitude
    else
      errors.add(:address, "が正しく解釈されませんでした")
      throw(:abort)
    end
  end
  
end
