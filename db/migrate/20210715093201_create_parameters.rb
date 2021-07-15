class CreateParameters < ActiveRecord::Migration[6.0]
  def change
    create_table :parameters do |t|
      t.text :weather_parameter

      t.timestamps
    end
  end
end
