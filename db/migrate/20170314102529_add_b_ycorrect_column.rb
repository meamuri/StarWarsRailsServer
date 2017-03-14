class AddBYcorrectColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :tmp_by, :integer
  end
end
