class ChangeFechaTransaccionFromOxxotransactions < ActiveRecord::Migration
  def change
    rename_column :oxxo_transactions, :fecha_transaccion, :crated_at

  end
end
