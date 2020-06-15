class AddCorporateToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_reference :challenges, :corporate, foreign_key: true
  end
end
