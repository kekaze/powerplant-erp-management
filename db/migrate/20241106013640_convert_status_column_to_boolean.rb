class ConvertStatusColumnToBoolean < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :status, :boolean, using: 'status::boolean'
  end
end
