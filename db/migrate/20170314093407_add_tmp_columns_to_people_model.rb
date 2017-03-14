class AddTmpColumnsToPeopleModel < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :tmp_mass, :integer
    add_column :people, :tmp_height, :integer
  end
end
