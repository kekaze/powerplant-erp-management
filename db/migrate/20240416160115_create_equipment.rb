class CreateEquipment < ActiveRecord::Migration[7.1]
  def change
    create_table :equipment do |t|
      t.string :unit_name, null: false
      t.string :identifier, null: false

      t.timestamps
    end
  end
end
