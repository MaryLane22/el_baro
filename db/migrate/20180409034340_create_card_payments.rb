class CreateCardPayments < ActiveRecord::Migration
  def change
    create_table :card_payments do |t|
      t.string   :nombre_propietario
      t.string   :nombre_banco
      t.string   :numero_tarjeta
      t.datetime :fecha_vencimiento
      t.integer  :codigo
      t.integer  :monto


    end
  end
end
