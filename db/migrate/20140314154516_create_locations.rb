class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
			t.belongs_to :book
			t.float :x
			t.float :y
			t.string :floor
			t.string :subject
			t.integer :section
      t.timestamps
    end
  end
end