module Types
  class FlightType < Types::BaseObject
    field :id, ID, null: false
    field :off, GraphQL::Types::ISO8601DateTime, null: true
    field :to, GraphQL::Types::ISO8601DateTime, null: true
    field :lan, GraphQL::Types::ISO8601DateTime, null: true
    field :on, GraphQL::Types::ISO8601DateTime, null: true
    field :status, String, null: true
    field :eta, GraphQL::Types::ISO8601DateTime, null: true

    field :lesson, LessonType, null: false
  end
end
