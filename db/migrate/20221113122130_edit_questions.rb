class EditQuestions < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :test, foreign_key: true, null: false
    remove_column :questions, :title, :string
  end
end
