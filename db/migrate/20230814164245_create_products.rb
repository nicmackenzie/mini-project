class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :category
      t.integer :current_qty
      t.integer :supplier_id
      t.timestamps
    end
  end
end
