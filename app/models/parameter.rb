class Parameter < ApplicationRecord
  # has_many :search_parameters
  validates :weather_parameter, presence: true
end
