class CreateMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :materials do |t|
      t.integer :matcode
      t.string :name
      t.decimal :unit_cost

      t.timestamps
    end

  add_index :materials, :matcode, unique: true
  end
end
