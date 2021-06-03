class AddBookingToTreehouse < ActiveRecord::Migration[6.0]
  def change
    add_reference :treehouses, :booking
  end
end
