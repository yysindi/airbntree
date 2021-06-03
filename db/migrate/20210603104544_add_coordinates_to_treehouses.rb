class AddCoordinatesToTreehouses < ActiveRecord::Migration[6.0]
  def change
    add_column :treehouses, :latitude, :float
    add_column :treehouses, :longitude, :float
  end
end
