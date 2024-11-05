class WeeklyPlansController < ApplicationController
  def new
    @athlete = Athlete.find(params[:athlete_id])
  end

  def create
    @athlete = Athlete.find(params[:athlete_id])

    start_date = params[:athlete][:start_date]

    if start_date.present?

      # Parse the start_date
      date = Date.parse(start_date)

      # Create the 7 new AssignedSession records for the week in memory without saving them
      sessions = []

      7.times do |i|
        session_type_param = params[:athlete]["session_type_#{i}"]
        details_param = params[:athlete]["details_#{i}"]

        sessions << @athlete.assigned_sessions.build(
          session_type: session_type_param,
          date: date + i.days,
          details: details_param
        )
      end

      # Validate all sessions
      if sessions.all?(&:valid?)
        # If all sessions are valid, save them in one transaction
        ActiveRecord::Base.transaction do
          sessions.each(&:save!)
        end

        redirect_to athlete_path(@athlete), notice: "New weekly plan successfully created."

      else
        # If any session is invalid, add errors to the athlete object and re-render the form
        sessions.each_with_index do |session, index|
          if session.invalid?
            session.errors.full_messages.each do |message|
              @athlete.errors.add(:base, "Session #{index + 1}: #{message}")
            end
          end
        end

        # Re-render the form with errors
        render :new, status: :unprocessable_entity
      end


    else
      render :new, status: :unprocessable_entity
    end
  end
end
