class CreateLessonExercises < ActiveRecord::Migration[8.0]
  def change
    create_table :lesson_exercises do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :exercise, null: false, foreign_key: true
      t.integer :score
      t.text :comment

      t.timestamps
    end
  end
end
