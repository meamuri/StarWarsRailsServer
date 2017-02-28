class CreateStarshipClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :starship_classes do |t|
      t.string :class

      t.timestamps
    end
  end
end
