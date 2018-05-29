class AddUserIdToOxxotransactions < ActiveRecord::Migration
  def change
    add_column :oxxo_transactions, :user_id, :integer
  end
  
end
