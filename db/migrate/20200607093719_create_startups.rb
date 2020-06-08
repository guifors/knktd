class CreateStartups < ActiveRecord::Migration[5.2]
  def change
    create_table :startups do |t|
      t.string :name
      t.string :description
      t.string :keywords
      t.string :location
      t.string :valuation

      t.timestamps
    end
  end
end
