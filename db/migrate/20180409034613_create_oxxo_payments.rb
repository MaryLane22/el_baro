class CreateOxxoPayments < ActiveRecord::Migration
  def change
    create_table :oxxo_payments do |t|
      t.integer  :codigo_emitido
      t.integer  :codigo_recibido
      t.datetime :fecha_vencimiento
      t.integer  :monto
    end
  end
end
