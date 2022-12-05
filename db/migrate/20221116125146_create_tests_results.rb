# frozen_string_literal: true

class CreateTestsResults < ActiveRecord::Migration[7.0]
  def change
    create_table :tests_results do |t|
      t.references :test, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :result

      t.timestamps
    end
  end
end
