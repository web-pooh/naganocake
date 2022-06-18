class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|

      t.integer :user_id,             null: false, default: ""
      t.string :postel_code,          null: false, default: ""
      t.integer :adress,              null: false, default: ""
      t.integer :receiver_name,       null: false, default: ""
      t.integer :user_id,             null: false, default: ""
      t.timestamps
    end
  end
end
