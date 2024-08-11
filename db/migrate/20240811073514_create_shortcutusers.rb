class CreateShortcutusers < ActiveRecord::Migration[7.1]
  def change
    create_table :shortcutusers do |t|
      t.string :username, null: false
      t.integer :role_id, null: false

      t.timestamps
    end
  end
end
