Types::QueryType = GraphQL::ObjectType.define do
  name "Query"


  field :airport, Types::AirportType do
    description "Airport Type"
    argument :id, !types.String
    resolve ->(root, args, ctx) {
      Airport.find(args[:id])
    }
  end

  field :zipcode, Types::ZipCodeType do
    description "ZipCode Type"
    argument :id, !types.Int

    resolve ->(root, args, ctx) {
      ZipCode.find(args[:id])
    }
  end

  field :zipsearch, Types::ZipSearchType do
    description "Zip Search"
    argument :q, !types.String

    resolve ->(root, args, ctx) {      
      {
        airports: Airport.query(args[:q]),
        zipcodes: Zipcode.query(args[:q])
      }
    }
  end


end
