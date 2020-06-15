class AddFakeEmailFieldToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :e_mail, :string
  end
end
