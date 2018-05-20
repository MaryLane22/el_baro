class CreateCardTransactions < ActiveRecord::Migration
  def change
    create_table :card_transactions do |t|

      t.datetime :fecha_transaccion
      t.string   :nombre_propietario
      t.string   :nombre_banco
      t.string   :numero_tarjeta
      t.datetime :fecha_vencimiento
      t.integer  :codigo
      t.float    :monto
      t.float    :total   



    end
  end
end
