class RenameUserIdColumnToAddresses < ActiveRecord::Migration[5.0]
  def change
    rename_column :addresses, :user_id, :customer_id
  end
end
