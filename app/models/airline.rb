class Airline
  include Mongoid::Document
  field :id, type: Integer
  field :name, type: String	#Name of the airline.
  field :alias, type: String	#Alias of the airline. For example, All Nippon Airways is commonly known as "ANA".
  field :iata, type: String	#2-letter IATA code, if available.
  field :icao, type: String	#3-letter ICAO code, if available.
  field :callsign, type: String	#Airline callsign.
  field :country, type: String	#Country or territory where airline is incorporated.
  field :active, type: String
end
