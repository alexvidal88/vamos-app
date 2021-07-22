class RemoveColumnWeatherSearch < ActiveRecord::Migration[6.0]
  def change
    remove_reference :weather_searches, :forecast_result, foreign_key: true
    add_reference :forecast_results, :weather_search, foreign_key: true
  end
end
