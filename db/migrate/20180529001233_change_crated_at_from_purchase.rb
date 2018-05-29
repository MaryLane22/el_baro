class ChangeCratedAtFromPurchase < ActiveRecord::Migration
  def change
    rename_column :purchases, :crated_at, :created_at
  end
end
