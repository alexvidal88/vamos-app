class AddWeatherSearchColumnToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :weather_search, null: false, foreign_key: true
  end
end
