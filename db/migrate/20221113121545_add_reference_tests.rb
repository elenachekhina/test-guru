class AddReferenceTests < ActiveRecord::Migration[7.0]
  def change
    add_reference :tests, :category, foreign_key: true, null: false
    add_reference :tests, :user, foreign_key: true, null: false
  end
end
