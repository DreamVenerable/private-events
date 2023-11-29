class AddForeignKeysToAttendances < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :attendances, :users, column: :attendee_id
    add_foreign_key :attendances, :events, column: :attended_event_id
  end
end
