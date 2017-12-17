class Airport
  include Mongoid::Document
  field :id, type: Integer
  field :name, type: String	#Name of airport. May or may not contain the City name.
  field :city, type: String	#Main city served by airport. May be spelled differently from Name.
  field :country, type: String	#Country or territory where airport is located. See countries.dat to cross-reference to ISO 3166-1 codes.
  field :iata, type: String	#3-letter IATA code. Null if not assigned/unknown.
  field :icao, type: String	#4-letter ICAO code.
  field :latitude, type: Float	#Decimal degrees, usually to six significant digits. Negative is South, positive is North.
  field :longitude, type: Float	#Decimal degrees, usually to six significant digits. Negative is West, positive is East.
  field :altitude, type: String	#In feet.
  field :timezone, type: String	#Hours offset from UTC. Fractional hours are expressed as decimals, eg. India is 5.5.
  field :dst, type: String	#Daylight savings time. One of E (Europe), A (US/Canada), S (South America), O (Australia), Z (New Zealand), N (None) or U (Unknown). See also: Help: Time
  field :tz, type: String #database time zone	Timezone in "tz" (Olson) format, eg. "America/Los_Angeles".
  field :type, type: String	#Type of the airport. Value "airport" for air terminals, "station" for train stations, "port" for ferry terminals and "unknown" if not known. In airports.csv, only type=airport is included.
  field :source, type: String	#Source of this data. "OurAirports" for data sourced from OurAirports, "Legacy" for old data not matched to OurAirports (mostly DAFIF), "User" for unverified user contributions. In airports.csv, only source=OurAirports is included.
end
