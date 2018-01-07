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

  def self.query(q)
    return if !q
    limit = q.length < 4 ? 10 : 25
    self.or(  { name: /#{q}/i }, { alias: /#{q}/i }, { callsign: /#{q}/i }, { iata: /#{q}/i }, { icao: /#{q}/i }, { country: /#{q}/i } ).limit(limit)
  end
end
