class ZipcodesController < ApplicationController
  #params.require(:zipcode).permit(:id, :q)

  # GET /zipcodes
  def index
    @zipcodes = Zipcode.query(params[:q])
    render json: @zipcodes
  end
end
