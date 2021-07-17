class WeatherSearch < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  belongs_to :forecast_result
  has_many :search_parameters
  has_many :parameters, through: :search_parameters

  validates :start_time, :end_time, :frecuency, :address, presence: true
  validate :end_time_after_start_time
end
