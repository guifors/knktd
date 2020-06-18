class AddNewPrivacyToCorporates < ActiveRecord::Migration[5.2]
  def change
    add_column :corporates, :privacy, :boolean
  end
end
