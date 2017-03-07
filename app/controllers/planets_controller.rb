class PlanetsController < ApplicationController
  before_action :set_planet, only: [:show, ]

  # GET /planets
  # GET /planets.json
  def index
    @planets = Planet.all
  end

  # GET /planets/1
  # GET /planets/1.json
  def show
  end

  def planets_ajax
    @page = params[:page] ? params[:page].to_i : 1
    @planets = Planet.offset((@page - 1) * 5).limit(5)
    @pages = Planet.count / 5 + (Planet.count % 5 == 0 ? 0 : 1)
    respond_to do |format|
      format.html { render :layout => false }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planet
      @planet = Planet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planet_params
      params.require(:planet).permit(:name, :diameter, :rotation_period, :orbital_period, :gravity, :population, :climate, :terrain, :surface_water)
    end
end
