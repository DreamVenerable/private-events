class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = current_user.attendances.build(attended_event_id: attendance_params)
    if @attendance.save
      redirect_to events_path
    else
      flash.now[:error] = 'Failed to attend the event.'
      render 'events/show'
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:event_id)
  end
end
