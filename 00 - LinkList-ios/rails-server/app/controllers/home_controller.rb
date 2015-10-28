class HomeController < ApplicationController
  def index
    @links = Reminder.by_date.still_valid
  end
end
