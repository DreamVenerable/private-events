class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = current_user.attendances.build(attendance_params)
    if @attendance.save
      redirect_to events_path, :notice => 'You are now attending the event.'
    else
      flash[:error] = 'Failed to attend the event.'
      redirect_to event_path(id: attendance_params.value)
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    redirect_to root_path, :notice => 'You have left the event.'
  end

  private

  def attendance_params
    params.require(:attendance).permit(:attended_event_id)
  end
end
