class WeatherSearch < ApplicationRecord
  belongs_to :user
  belongs_to :forecast_result
  has_many :search_parameters
  has_many :parameters, through: :search_parameters

  validates :start_time, :end_time, :frecuency, presence: true
  validate :end_time_after_start_time

end
