class Route
  include Mongoid::Document
  field :airline_code, type: String	#2-letter (IATA) or 3-letter (ICAO) code of the airline.
  field :airline_id, type: Integer	#Unique OpenFlights identifier for airline (see Airline).
  field :source_airport_code, type: String	#3-letter (IATA) or 4-letter (ICAO) code of the source airport.
  field :source_airport_id, type: Integer #	Unique OpenFlights identifier for source airport (see Airport)
  field :destination_airport_code, type: String	#3-letter (IATA) or 4-letter (ICAO) code of the destination airport.
  field :destination_airport_id, type: Integer	#Unique OpenFlights identifier for destination airport (see Airport)
  field :codeshare, type: String	#"Y" if this flight is a codeshare (that is, not operated by Airline, but another carrier), empty otherwise.
  field :stops, type: String	#Number of stops on this flight ("0" for direct)
  field :equipment, type: String
end
