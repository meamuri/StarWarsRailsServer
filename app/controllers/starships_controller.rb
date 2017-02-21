class StarshipsController < ApplicationController
  before_action :set_starship, only: [:show, :edit, :update, :destroy]

  # GET /starships
  # GET /starships.json
  def index
    @starships = Starship.all
  end

  # GET /starships/1
  # GET /starships/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_starship
      @starship = Starship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def starship_params
      params.require(:starship).permit(:name, :model, :starship_class, :manufacturer, :cost_in_credits, :length, :crew, :passengers, :max_atmosphering_speed, :hyperdrive_rating, :MGLT, :cargo_capacity, :consumables)
    end
end
