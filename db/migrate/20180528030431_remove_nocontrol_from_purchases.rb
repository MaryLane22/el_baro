class RemoveNocontrolFromPurchases < ActiveRecord::Migration
  def change
    remove_column :purchases, :nocontrol
  end
end
