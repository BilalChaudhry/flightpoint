Types::ZipSearchType = GraphQL::ObjectType.define do
    name "ZipSearch"

    field :airports do
        type -> { types[Types::AirportType]}
        resolve -> (obj, args, ctx){
            obj[:airports]
         }
    end

    field :zipcodes do
        type -> { types[Types::ZipCodeType]}
        resolve -> (obj, args, ctx){
            obj[:zipcodes]
         }
    end
end
