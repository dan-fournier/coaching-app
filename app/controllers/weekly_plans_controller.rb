class WeeklyPlansController < ApplicationController
  def new
    @athlete = Athlete.find(params[:athlete_id])
  end

  def create
    @athlete = Athlete.find(params[:athlete_id])

    start_date = params[:athlete][:start_date]

    if start_date.present?

      date = Date.parse(start_date)

      @athlete.assigned_sessions.create!(
        session_type: params[:athlete][:session_type_0],
        date: date,
        details: params[:athlete][:details_0]
      )
      @athlete.assigned_sessions.create!(
        session_type: params[:athlete][:session_type_1],
        date: date + 1,
        details: params[:athlete][:details_1]
      )
      @athlete.assigned_sessions.create!(
        session_type: params[:athlete][:session_type_2],
        date: date + 2,
        details: params[:athlete][:details_2]
      )
      @athlete.assigned_sessions.create!(
        session_type: params[:athlete][:session_type_3],
        date: date + 3,
        details: params[:athlete][:details_3]
      )
      @athlete.assigned_sessions.create!(
        session_type: params[:athlete][:session_type_4],
        date: date + 4,
        details: params[:athlete][:details_4]
      )
      @athlete.assigned_sessions.create!(
        session_type: params[:athlete][:session_type_5],
        date: date + 5,
        details: params[:athlete][:details_5]
      )
      @athlete.assigned_sessions.create!(
        session_type: params[:athlete][:session_type_6],
        date: date + 6,
        details: params[:athlete][:details_6]
      )
    end

    redirect_to athlete_path(@athlete), notice: "New plan successfully created"
  end
end
