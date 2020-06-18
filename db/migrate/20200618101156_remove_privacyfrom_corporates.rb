class RemovePrivacyfromCorporates < ActiveRecord::Migration[5.2]
  def change
    remove_column :corporates, :privacy
  end
end
