class WeatherSearch < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :forecast_results
  has_many :search_parameters
  has_many :parameters, through: :search_parameters

  # validates :start_time, :end_time, :frecuency, :address, presence: true
  validate :end_time_after_start_time

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time < start_time
      errors.add(:end_time, "must be after the start time")
    end
  end

  def unavailable_dates
    @searches.pluck(:start_time, :end_time).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
