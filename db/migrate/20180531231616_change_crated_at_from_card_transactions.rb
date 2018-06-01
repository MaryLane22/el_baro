class ChangeCratedAtFromCardTransactions < ActiveRecord::Migration
  def change
    rename_column :card_transactions, :crated_at, :created_at

  end
end
