class AddPositionToChapters < ActiveRecord::Migration[5.1]
  def change
    add_column :chapters, :position, :integer, default: 0
    add_index :chapters, [:position], name: 'chapters_position_index'
  end
end
