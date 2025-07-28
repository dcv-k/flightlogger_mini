# app/controllers/lessons_controller.rb
class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    @all_exercises = Exercise.joins(:lesson_exercises)
                             .select('exercises.*, COUNT(lesson_exercises.id) as usage_count, AVG(lesson_exercises.score) as avg_score')
                             .group('exercises.id')
                             .order(:name)
  end
end
