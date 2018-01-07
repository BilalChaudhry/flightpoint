Types::AirlineType = GraphQL::ObjectType.define do
    name "Airline"
    description "Describes airlines"
    field :id, !types.Int
    field :name, !types.String	
    field :alias, !types.String	
    field :iata, !types.String	
    field :icao, !types.String	
    field :callsign, !types.String	
    field :country, !types.String	
    field :active, !types.String
    
end
