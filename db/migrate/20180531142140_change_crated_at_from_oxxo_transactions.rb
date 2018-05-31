class ChangeCratedAtFromOxxoTransactions < ActiveRecord::Migration
  def change
    rename_column :oxxo_transactions, :crated_at, :created_at
  end
end
