class AddPublishedToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :published, :boolean, default: false
  end
end
