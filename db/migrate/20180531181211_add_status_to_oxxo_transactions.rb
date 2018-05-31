class AddStatusToOxxoTransactions < ActiveRecord::Migration
  def change
    add_column :oxxo_transactions, :status, :integer
  end
end
