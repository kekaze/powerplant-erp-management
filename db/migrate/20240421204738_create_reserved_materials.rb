class CreateReservedMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :reserved_materials do |t|
      t.references :reservation, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :subtotal

      t.timestamps
    end
  end
end
