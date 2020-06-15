class CreateCorporates < ActiveRecord::Migration[5.2]
  def change
    create_table :corporates do |t|

      t.timestamps
    end
  end
end
