class AthletesController < ApplicationController
  def index
    @athletes = Athlete.all
  end

  def show
    @athlete = Athlete.find(params[:id])
    @start_date = Date.current.beginning_of_week
  end
end
