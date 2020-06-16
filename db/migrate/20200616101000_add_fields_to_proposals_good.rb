class AddFieldsToProposalsGood < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :usp, :string
    add_column :proposals, :poc_description, :string
    add_column :proposals, :poc_examples, :string
    add_column :proposals, :match_criteria, :boolean, default: false
  end
end
