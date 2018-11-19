class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :movie_length, null: false
      t.string :director, null: false
      t.string :rating, null: false

      t.timestamps
    end
  end
end
