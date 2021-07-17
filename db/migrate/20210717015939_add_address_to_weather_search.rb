class AddAddressToWeatherSearch < ActiveRecord::Migration[6.0]
  def change
    add_column :weather_searches, :address, :string
  end
end
