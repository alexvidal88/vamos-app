class CreateForecastResults < ActiveRecord::Migration[6.0]
  def change
    create_table :forecast_results do |t|
      t.text :result

      t.timestamps
    end
  end
end
