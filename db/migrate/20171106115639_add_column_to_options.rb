class AddColumnToOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :options, :correct, :boolean, default: false
  end
end
