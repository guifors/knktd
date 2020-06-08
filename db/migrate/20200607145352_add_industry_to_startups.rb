class AddIndustryToStartups < ActiveRecord::Migration[5.2]
  def change
    add_column :startups, :industry, :string
  end
end
