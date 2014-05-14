class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.integer :catalog_number
      t.text :description
      t.references :category, index: true

      t.timestamps
    end
    add_index :products, :catalog_number, unique: true
  end
end
