class LessonExercise < ApplicationRecord
  belongs_to :lesson
  belongs_to :exercise

  validates :score, numericality: { only_integer: true }, allow_nil: true
end
