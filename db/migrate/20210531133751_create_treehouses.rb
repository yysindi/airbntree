class CreateTreehouses < ActiveRecord::Migration[6.0]
  def change
    create_table :treehouses do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :img
      t.string :location

      t.timestamps
    end
  end
end
