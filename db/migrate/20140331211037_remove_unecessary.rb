class RemoveUnecessary < ActiveRecord::Migration
  def change
		drop_table :locations
		remove_column :shelves, :x
		remove_column :shelves, :y
  end
end
