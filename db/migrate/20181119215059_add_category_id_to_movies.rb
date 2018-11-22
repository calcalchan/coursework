class AddCategoryIdToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :category_id, :integer
  end
end
