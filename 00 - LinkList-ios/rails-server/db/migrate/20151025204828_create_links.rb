class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links, id: :uuid do |t|
      t.string :url, null: false
      t.string :title
      t.string :tags, array: true, default: []

      t.timestamps null: false
    end
  end
end
