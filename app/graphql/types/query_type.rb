# app/graphql/types/query_type.rb
module Types
  class QueryType < Types::BaseObject
    # All flights
    field :flights, [FlightType], null: false

    def flights
      Flight.includes(:lesson).all
    end

    # Single flight by ID
    field :flight, FlightType, null: true do
      argument :id, ID, required: true
    end

    def flight(id:)
      Flight.find_by(id: id)
    end
  end
end