class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :cat_number
      t.string :description

      t.timestamps
    end
    add_index :products, :cat_number, unique: true
  end
end
