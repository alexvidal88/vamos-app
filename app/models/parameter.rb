class Parameter < ApplicationRecord
  # has_many :search_parameters
  validates :weather_parameter, :weather_key, :activity_type, presence: true
end
