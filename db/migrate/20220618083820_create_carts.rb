class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :customer_id, null: false, default: ""
      t.integer :item_id, null: false, default: ""
      t.integer :count, null: false, default: ""
      t.timestamps
    end
  end
end
