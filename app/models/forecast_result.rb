class ForecastResult < ApplicationRecord
  belongs_to :weather_search
  validates :result, presence: true
end
