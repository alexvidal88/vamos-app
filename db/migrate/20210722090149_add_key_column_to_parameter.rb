class AddKeyColumnToParameter < ActiveRecord::Migration[6.0]
  def change
    add_column :parameters, :weather_key, :string
  end
end
