Types::ZipSearchType = GraphQL::ObjectType.define do
    name "ZipSearch"

    field :airports do
        type -> { types[Types::AirportType]}
        resolve -> (obj, args, ctx){
            Airport.query(obj[:q])
         }
    end

    field :zipcodes do
        type -> { types[Types::ZipCodeType]}
        resolve -> (obj, args, ctx){            
            Zipcode.query(obj[:q])
         }
    end

    field :airlines do
        type -> { types[Types::AirlineType]}
        resolve -> (obj, args, ctx){
            Airline.query(obj[:q])
         }
    end

end
