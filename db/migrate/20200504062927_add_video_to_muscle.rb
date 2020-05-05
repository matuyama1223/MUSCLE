class AddVideoToMuscle < ActiveRecord::Migration[5.2]
  def change
    add_column :muscles, :video_id, :string
  end
end
