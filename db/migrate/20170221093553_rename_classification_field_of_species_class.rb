class RenameClassificationFieldOfSpeciesClass < ActiveRecord::Migration[5.0]
  def change
    remove_column :species, :classifiation
    add_column :species, :classification, :string
  end
end
