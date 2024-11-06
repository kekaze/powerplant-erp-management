class AddDefaultValueForStatusColumn < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :status, :boolean, default: true
  end
end
