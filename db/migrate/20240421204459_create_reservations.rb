class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.integer :reservation_number
      t.integer :wor_number, null: false
      t.timestamp :issued_at
      t.string :status
      t.decimal :total_cost

      t.timestamps
    end
    add_index :reservations, :reservation_number, unique: true
    add_index :reservations, :wor_number

    # Manually add a foreign key constraint
    execute <<-SQL
      ALTER TABLE reservations
      ADD CONSTRAINT fk_wor_number
      FOREIGN KEY (wor_number)
      REFERENCES work_orders(wor_number)
      ON DELETE CASCADE;
    SQL
  end
end
