class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :cell, null: false
      t.string :password_digest, null: false
      t.timestamps
    end

    add_index :users, [:cell], name: 'users_cell_password_index'
  end
end
