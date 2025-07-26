class Lesson < ApplicationRecord
  has_many :lesson_exercises, dependent: :destroy
  has_many :exercises, through: :lesson_exercises
  has_one :flight, dependent: :destroy
end
