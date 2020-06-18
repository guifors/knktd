class AddPrivacyToCorporates < ActiveRecord::Migration[5.2]
  def change
    add_column :corporates, :privacy, :boolean, default: false
  end
end
