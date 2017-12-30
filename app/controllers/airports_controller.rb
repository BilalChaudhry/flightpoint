class AirportsController < ApplicationController
  before_action :set_airport, only: [:show]

  # GET /airports
  def index
    @airports = Airport.by_distance(params[:x], params[:y], params[:distance])

    render json: @airports
  end

  # GET /airports/1
  def show
    render json: @airport
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airport
      @airport = Airport.find(params[:id])
    end
end
