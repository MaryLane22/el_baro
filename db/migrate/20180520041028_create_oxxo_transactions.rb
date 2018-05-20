class CreateOxxoTransactions < ActiveRecord::Migration
  def change
    create_table :oxxo_transactions do |t|

      t.datetime :fecha_transaccion
      t.integer  :codigo_emitido
      t.integer  :codigo_recibido
      t.datetime :fecha_vencimiento
      t.float    :monto
      t.float    :total
    end
  end
end
