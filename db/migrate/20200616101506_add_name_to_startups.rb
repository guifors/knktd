class AddNameToStartups < ActiveRecord::Migration[5.2]
  def change
    add_column :startups, :employee_name, :string
    add_column :startups, :employee_surname, :string
    add_column :startups, :employee_job_title, :string
    add_column :startups, :employee_email, :string
  end
end
