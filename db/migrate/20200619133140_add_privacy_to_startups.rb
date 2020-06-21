class AddPrivacyToStartups < ActiveRecord::Migration[5.2]
  def change
    add_column :startups, :privacy, :boolean
  end
end
