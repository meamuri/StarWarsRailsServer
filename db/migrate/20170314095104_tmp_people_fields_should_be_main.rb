class TmpPeopleFieldsShouldBeMain < ActiveRecord::Migration[5.0]
  def change
    remove_column :people, :height
    remove_column :people, :mass
    rename_column :people, :tmp_height, :height
    rename_column :people, :tmp_mass, :mass
  end
end
