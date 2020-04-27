class AddMuscleGenreToMuscles < ActiveRecord::Migration[5.2]
  def change
    add_column :muscles, :muscle_genre, :string
  end
end
