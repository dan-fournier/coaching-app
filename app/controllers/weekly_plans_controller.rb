class WeeklyPlansController < ApplicationController
  def new
    @athlete = Athlete.find(params[:athlete_id])
  end
end
