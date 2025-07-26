class Exercise < ApplicationRecord
  has_many :lesson_exercises, dependent: :destroy
  has_many :lessons, through: :lesson_exercises
end
