class ChangeFechaCompraFromPurchase < ActiveRecord::Migration
  def change
    rename_column :purchases, :fecha_compra, :crated_at
  end
end
