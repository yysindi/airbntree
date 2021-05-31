class AddReferenceToTreehouse < ActiveRecord::Migration[6.0]
  def change
    add_reference :treehouses, :user, null: false, foreign_key: true
  end
end
