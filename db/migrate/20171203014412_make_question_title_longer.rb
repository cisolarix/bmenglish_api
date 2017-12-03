class MakeQuestionTitleLonger < ActiveRecord::Migration[5.1]
  def change
    change_column :questions, :title, :text, limit: 16.megabytes
  end
end
