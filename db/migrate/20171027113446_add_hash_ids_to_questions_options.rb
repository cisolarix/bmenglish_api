class AddHashIdsToQuestionsOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :hash_id, :string
    add_column :options, :hash_id, :string
    add_index :questions, :hash_id, name: 'questions_hash_id_index'
    add_index :options, :hash_id, name: 'options_hash_id_index'
  end
end
