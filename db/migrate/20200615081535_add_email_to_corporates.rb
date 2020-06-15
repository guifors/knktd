class AddEmailToCorporates < ActiveRecord::Migration[5.2]
  def change
    add_column :corporates, :email, :string
  end
end
