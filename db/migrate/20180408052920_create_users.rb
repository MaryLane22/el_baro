class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :nocontrol
      t.string  :nombre
      t.string  :usuario
      t.string  :password
      t.string  :carrera
      t.integer :semestre
      t.integer :cant_baros
    end
  end
end
