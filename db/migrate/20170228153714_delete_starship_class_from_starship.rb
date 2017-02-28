class DeleteStarshipClassFromStarship < ActiveRecord::Migration[5.0]
  def change
    remove_column :starships, :starship_class, :string
  end
end
