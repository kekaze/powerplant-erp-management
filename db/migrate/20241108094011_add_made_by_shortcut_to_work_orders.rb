class AddMadeByShortcutToWorkOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :work_orders, :made_by_shortcut, :boolean, null: false
  end
end
