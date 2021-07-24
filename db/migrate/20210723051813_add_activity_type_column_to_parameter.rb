class AddActivityTypeColumnToParameter < ActiveRecord::Migration[6.0]
  def change
    add_column :parameters, :activity_type, :string
  end
end
