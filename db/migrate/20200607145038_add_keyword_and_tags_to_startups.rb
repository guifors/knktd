class AddKeywordAndTagsToStartups < ActiveRecord::Migration[5.2]
  def change
    add_column :startups, :keyword, :string
    add_column :startups, :tags, :string
  end
end
