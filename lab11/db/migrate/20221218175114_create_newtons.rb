class CreateNewtons < ActiveRecord::Migration[7.0]
  def change
    create_table :newtons do |t|
      t.float :key
      t.json :data

      t.timestamps
    end
    add_index :newtons, :key, unique: true
  end
end
