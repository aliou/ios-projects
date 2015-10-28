class SetTitleToExistingReminders < ActiveRecord::Migration
  def change
    Reminder.find_each do |r|
      r.send(:fetch_title)
    end
  end
end
