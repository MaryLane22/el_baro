class CreatePurchaseServices < ActiveRecord::Migration
  def change
    create_table :purchase_services do |t|
      t.integer :purchase_id
      t.integer :service_id
    end
  end
end
