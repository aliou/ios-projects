class AddTitleToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :title, :string, default: ''
  end
end
