class AddFieldsToCorporates < ActiveRecord::Migration[5.2]
  def change
    add_column :corporates, :name, :string
    add_column :corporates, :surname, :string
    add_column :corporates, :job_title, :string
    add_column :corporates, :company_name, :string
    add_column :corporates, :company_description, :string
    add_column :corporates, :company_usp, :string
    add_column :corporates, :company_poc_description, :string
    add_column :corporates, :company_poc_examples, :string
    add_column :corporates, :company_industry, :string
  end
end
