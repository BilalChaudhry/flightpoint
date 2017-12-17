class Zipcode
  include Mongoid::Document
  field :id, type: Integer
  field :zipcode, type: String
  field :zip_code_type, type: String
  field :city, type: String
  field :state, type: String
  field :location_type, type: String
  field :latitude, type: Integer
  field :longitude, type: Integer
  field :x_axis, type: Integer
  field :y_axis, type: Integer
  field :z_axis, type: Integer
  field :world_region, type: String
  field :country, type: String
  field :location_text, type: String
  field :location, type: String
  field :decommisioned, type: String
  field :tax_returns_filed, type: String
  field :estimated_population, type: String
  field :total_wages, type: String
  field :notes, type: String
end