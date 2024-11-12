class AddShortcutUserColumnsToWorkOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :work_orders, :sc_requestor, :string
    add_column :work_orders, :sc_reviewer, :string
    add_column :work_orders, :sc_approver, :string
    add_column :work_orders, :sc_closer, :string
  end
end
