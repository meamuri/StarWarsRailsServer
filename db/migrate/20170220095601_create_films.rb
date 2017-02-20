class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|
      t.string :title
      t.integer :episode_id
      t.text :opening_crawl
      t.string :director
      t.string :producer
      t.datetime :release_date

      t.timestamps
    end
  end
end
