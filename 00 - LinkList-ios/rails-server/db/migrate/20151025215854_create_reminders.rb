class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders, id: :uuid do |t|
      t.string :url, null: false

      t.timestamps null: false
    end
  end
end
