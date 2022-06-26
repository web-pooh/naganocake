class ChangeDataReceiverNameToAddresses < ActiveRecord::Migration[6.1]
  def change
    change_column :addresses, :receiver_name, :string
  end
end
