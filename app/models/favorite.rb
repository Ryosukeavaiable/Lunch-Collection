class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :map
  
  validates :user_id, uniqueness: {scope: :map_id}
end
