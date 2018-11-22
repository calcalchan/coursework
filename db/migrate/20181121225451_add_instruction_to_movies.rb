class AddInstructionToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :instruction, :text, null: false
  end
end
