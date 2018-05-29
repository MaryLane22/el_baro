class ChangeCantBarosFromUsers < ActiveRecord::Migration
  def change
    change_column :users, :cant_baros, :float
  end
end
