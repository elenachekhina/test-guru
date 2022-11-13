class DropTables < ActiveRecord::Migration[7.0]
  def change
    drop_join_table :tests, :categories
    drop_join_table :tests, :questions
  end
end
