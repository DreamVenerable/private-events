class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :event_datetime
      t.string :location
      t.timestamps
    end
  end
end
