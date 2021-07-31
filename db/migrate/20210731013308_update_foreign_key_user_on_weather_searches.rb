class UpdateForeignKeyUserOnWeatherSearches < ActiveRecord::Migration[6.0]
  def change
    remove_reference :weather_searches, :user, foreign_key: true
    add_reference :weather_searches, :user, null: true, foreign_key: true
  end
end
