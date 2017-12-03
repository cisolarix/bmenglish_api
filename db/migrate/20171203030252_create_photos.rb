class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.text :image_data
      t.timestamps null: false
    end
  end
end
