class CreateLessons < ActiveRecord::Migration[8.0]
  def change
    create_table :lessons do |t|
      t.string :lesson_number

      t.timestamps
    end
  end
end
