class RenameClassInStarshipClass < ActiveRecord::Migration[5.0]
  def change
    rename_column :starship_classes, :class, :name
  end
end
