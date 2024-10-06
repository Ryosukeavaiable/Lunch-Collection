class Map < ApplicationRecord
validates :title, :body, :photo, :address, presence: true
 validates :genre, presence: true, inclusion: { in: ['麺類', 'ご飯系', '和食', '洋食','中華', '辛い'], message: "は指定されたジャンルから選択してください" }
has_many :comments, dependent: :destroy
belongs_to :user
has_many :favorites, dependent: :destroy

def favorited_by?(user)
  favorites.exists?(user_id: user.id)
end

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
