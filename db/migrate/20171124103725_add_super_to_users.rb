class AddSuperToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :super, :boolean, default: false
  end
end
