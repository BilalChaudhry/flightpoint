Types::ZipCodeType = GraphQL::ObjectType.define do
    name "ZipCode"
    field :id, !types.Int
    field :name, !types.String, property: :zipcode
    field :zipcode, !types.String
    field :zip_code_type, !types.String
    field :city, !types.String
    field :state, !types.String
    field :location_type, !types.String
    field :latitude, !types.Int
    field :longitude, !types.Int
    field :x_axis, !types.Int
    field :y_axis, !types.Int
    field :z_axis, !types.Int
    field :world_region, !types.String
    field :country, !types.String
    field :location_text, !types.String
    field :location, !types.String
    field :decommisioned, !types.String
    field :tax_returns_filed, !types.String
    field :estimated_population, !types.String
    field :total_wages, !types.String
    field :notes, !types.String
    field :location, types[types.Int]
end
