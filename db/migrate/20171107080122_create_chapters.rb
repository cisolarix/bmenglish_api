class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.string :title
      t.string :ancestry
    end
    add_index :chapters, :ancestry
  end
end
