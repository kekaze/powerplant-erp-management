class AddColumnToUsersTable < ActiveRecord::Migration[7.1]
  def change
    add_column :Users, :status, :string
  end
end
