class PeopleController < ApplicationController
  before_action :set_person, only: [:show, ]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :birth_year, :eye_color, :gender, :hair_color, :height, :mass, :skin_color)
    end
end
