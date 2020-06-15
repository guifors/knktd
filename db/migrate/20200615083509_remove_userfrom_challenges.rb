class RemoveUserfromChallenges < ActiveRecord::Migration[5.2]
  def change
    remove_column :challenges, :user_id
  end
end
