class TmpBirthYeareNowGeneral < ActiveRecord::Migration[5.0]
  def change
    remove_column :people, :birth_year
    rename_column :people, :tmp_by, :birth_year
  end
end
