class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :question, null: false, foreign_key: true
      t.belongs_to :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
