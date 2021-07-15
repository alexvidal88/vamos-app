class CreateWeatherSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :weather_searches do |t|
      t.string :start_time
      t.string :end_time
      t.string :frecuency
      t.references :user, null: false, foreign_key: true
      t.references :forecast_result, null: false, foreign_key: true

      t.timestamps
    end
  end
end
