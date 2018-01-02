Types::AirportType = GraphQL::ObjectType.define do
    name "Airport"
    description "Describes airports, terminals, train stations"
    field :id, !types.String
    field :name, !types.String
    field :city, !types.String
    field :country, !types.String
    field :iata, !types.String
    field :icao, !types.String
    field :latitude, !types.Float
    field :longitude, !types.Float
    field :altitude, !types.Int
    field :timezone, !types.Int
    field :dst, !types.String
    field :tz, !types.String
    field :type, !types.String
    field :source, !types.String
    field :location, types[types.Int]
  end
  