class Comment < ApplicationRecord
  belongs_to :weather_search
  belongs_to :user
  validates :content, length: {minimum: 5}
end
