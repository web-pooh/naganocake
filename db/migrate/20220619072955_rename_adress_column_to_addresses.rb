class RenameAdressColumnToAddresses < ActiveRecord::Migration[5.0]
  def change
    rename_column :addresses, :adress, :address
  end
end
