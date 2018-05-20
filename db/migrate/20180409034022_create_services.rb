class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string  :nombre
      t.string  :descripcion
      t.integer :precio
    end
  end
end
