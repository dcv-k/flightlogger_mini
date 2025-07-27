module Types
  class LessonType < Types::BaseObject
    field :id, ID, null: false
    field :lesson_number, String, null: true
  end
end
