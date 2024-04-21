class CreateWorkOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :work_orders do |t|
      t.integer :wor_number, null: false
      t.references :equipment, null: false, foreign_key: true
      t.string :priority, null: false
      t.string :description, null: false
      t.string :status, null: false
      t.timestamp :inspected_at, null: false
      t.references :requestor, null: false, foreign_key: { to_table: :users }
      t.timestamp :reviewed_at, null: true
      t.references :reviewer, null: true, foreign_key: { to_table: :users }
      t.timestamp :approved_at, null: true
      t.references :approver, null: true, foreign_key: { to_table: :users }
      t.timestamp :closed_at, null: true
      t.references :closer, null: true, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :work_orders, :wor_number, unique: true
  end
end
