class CreateMuscleComments < ActiveRecord::Migration[5.2]
  def change
    create_table :muscle_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :muscle_id

      t.timestamps
    end
  end
end
