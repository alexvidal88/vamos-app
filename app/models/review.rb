class Review < ApplicationRecord
  belongs_to :weather_search
  belongs_to :user
  has_one_attached :photo
  validates :content, length: {minimum: 3}
end
