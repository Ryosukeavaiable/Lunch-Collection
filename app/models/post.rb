class Post < ApplicationRecord
validates :title, :body, :photo, :address, presence: true

belongs_to :user
has_many :maps
end
