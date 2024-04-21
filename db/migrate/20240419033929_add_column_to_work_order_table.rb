class AddColumnToWorkOrderTable < ActiveRecord::Migration[7.1]
  def change
    add_column :work_orders, :running_hours, :decimal
  end
end
