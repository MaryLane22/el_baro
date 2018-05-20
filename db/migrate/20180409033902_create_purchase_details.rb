class CreatePurchaseDetails < ActiveRecord::Migration
  def change
    create_table :purchase_details do |t|
      t.integer :purchase_id
      t.integer :service_id
      t.integer :cantidad

    end
  end
end
