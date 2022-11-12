class CreateJoinTableTestQuestion < ActiveRecord::Migration[7.0]
  def change
    create_join_table :tests, :questions do |t|
      t.index :test_id
      t.index :question_id

      t.timestamps
    end
  end
end
