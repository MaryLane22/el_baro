class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer  :nocontrol
      t.datetime :fecha_compra
      t.integer  :total
    end
  end
end
