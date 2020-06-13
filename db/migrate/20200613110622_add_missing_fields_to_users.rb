class AddMissingFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :job_title, :string
    add_column :users, :company_name, :string
    add_column :users, :company_description, :string
    add_column :users, :company_usp, :string
    add_column :users, :company_poc_description, :string
    add_column :users, :company_poc_examples, :string
    add_column :users, :company_industry, :string
    add_column :users, :corporate, :boolean, default: false
    add_column :users, :startup, :boolean, default: false
  end
end
