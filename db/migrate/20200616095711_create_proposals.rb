class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.references :challenge, foreign_key: true
      t.references :startup, foreign_key: true

      t.timestamps
    end
  end
end
