class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.string :description
      t.string :region
      t.string :search_criteria
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
