class RecreateAttendances < ActiveRecord::Migration[7.1]
  def change
    drop_table :attendances, if_exists: true

    create_table :attendances do |t|
      t.references :attendee, null: false, foreign_key: true
      t.references :attended_event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
