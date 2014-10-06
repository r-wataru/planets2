class SchedulesController < ApplicationController
  def index
    if params[:change].present?
      day_array = params[:change].unpack("a4a2")
      @year = day_array[0].to_i
      @month = day_array[1].to_i
    else
      @month = Time.now.month
      @year = Time.now.year
    end
    @now_month = Date.new(@year,@month,1)
    @schedules = Schedule.new(@year,@month).make_array
  end
end