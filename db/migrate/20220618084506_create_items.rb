class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false, default: ""
      t.boolean :is_active, null: false, default: "true"
      t.string :name, null: false, default: ""
      t.text :description, null: false, default: ""
      t.integer :price, null: false, default: ""
      t.timestamps
    end
  end
end
