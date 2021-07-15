class CreateSearchParameters < ActiveRecord::Migration[6.0]
  def change
    create_table :search_parameters do |t|
      t.references :weather_search, null: false, foreign_key: true
      t.references :parameter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
