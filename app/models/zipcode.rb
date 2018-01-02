class Zipcode
  include Mongoid::Document
  include Mongoid::Geospatial
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
  field :location, type: Point, spatial: true, delegate: true	#Geospatial search point data 
  spatial_index :location, {bits: 24, min: -180, max: 180}
  spatial_scope :location

  def self.query(q)
    return if !q
    limit = q.length < 4 ? 10 : 25
    numbers_only_q = q.gsub(/\D/, '')
    self.or( { zipcode: /#{numbers_only_q.blank? ? 'AA' : numbers_only_q}/ }, { city: /#{q}/i }, { state: /#{q}/i } ).limit(limit)
  end
end