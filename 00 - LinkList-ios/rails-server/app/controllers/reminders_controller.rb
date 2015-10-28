class RemindersController < ApplicationController
  def index
    @reminders = Reminder.still_valid.by_date
    render json: @reminders, root: false
  end

  def create
    @reminder = Reminder.create!(reminder_params)
    render json: @reminder
  end

  private

  def reminder_params
    params.require(:reminder).permit(:url)
  end
end
