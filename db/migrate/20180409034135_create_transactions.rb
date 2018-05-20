class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer  :nocontrol
      t.integer  :saldo
      t.string   :forma_pago
      t.datetime :fecha_transaccion
    end
  end
end
