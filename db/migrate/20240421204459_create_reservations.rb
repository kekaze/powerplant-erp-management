class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.integer :reservation_number
      t.references :wor_number, null: false, foreign_key: true
      t.timestamp :issued_at
      t.string :status
      t.decimal :total_cost

      t.timestamps
    end
    add_index :reservations, :reservation_number, unique: true
  end
end
