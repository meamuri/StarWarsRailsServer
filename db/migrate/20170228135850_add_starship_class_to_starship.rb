class AddStarshipClassToStarship < ActiveRecord::Migration[5.0]
  def change
    add_reference :starships, :starship_class, foreign_key: true
  end
end
