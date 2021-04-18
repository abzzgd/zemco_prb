class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :amount
      t.integer :code
      t.string :category
      t.integer :price

      t.timestamps
    end
  end
end
