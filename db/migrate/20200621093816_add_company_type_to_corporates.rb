class AddCompanyTypeToCorporates < ActiveRecord::Migration[5.2]
  def change
    add_column :corporates, :company_type, :string
  end
end
