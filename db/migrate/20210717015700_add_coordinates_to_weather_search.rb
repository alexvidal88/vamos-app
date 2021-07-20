class AddCoordinatesToWeatherSearch < ActiveRecord::Migration[6.0]
  def change
    add_column :weather_searches, :latitude, :float
    add_column :weather_searches, :longitude, :float
  end
end
