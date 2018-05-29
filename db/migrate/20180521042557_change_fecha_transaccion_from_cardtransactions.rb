class ChangeFechaTransaccionFromCardtransactions < ActiveRecord::Migration
  def change
    rename_column :card_transactions, :fecha_transaccion, :crated_at
  end
end
