class AddUserIdToCardtransactions < ActiveRecord::Migration
  def change
    add_column :card_transactions, :user_id, :integer
  end
end
