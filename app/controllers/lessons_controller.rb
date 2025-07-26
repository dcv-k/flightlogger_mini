# app/controllers/lessons_controller.rb
class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
  end
end
