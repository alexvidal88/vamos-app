class AddWeatherTypeToWeatherSearch < ActiveRecord::Migration[6.0]
  def change
    add_column :weather_searches, :weather_type, :string
  end
end
