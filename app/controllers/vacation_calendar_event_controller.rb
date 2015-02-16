class VacationCalendarEventController < ApplicationController
  unloadable

  def new
    parametrs= params
    @vacation_calendar_event= VacationCalendarEvent.new
    @vacation_calendar_event.vacation_calendar_id=params[:vacation_calendar_id]
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @vacation_calendar_event = VacationCalendarEvent.new(params[:vacation_calendar_event])
    respond_to do |format|
      if @vacation_calendar_event.save
        flash[:notice] = l(:notice_successful_create)
        format.html { redirect_back_or_default settings_project_path(@vacation_calendar_event.vacation_calendar.project, :tab => 'vacation_calendar') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def edit
    parameters=params
    @vacation_calendar_event = VacationCalendarEvent.find(params[:vacation_calendar_event_id])
    respond_to do |format|
      format.html
    end
  end
  
  def destroy
    @vacation_calendar_event = VacationCalendarEvent.find(params[:id])
    @vacation_calendar_event.destroy
    respond_to do |format|
      flash[:notice] = l(:notice_successful_delete)
      format.html { redirect_to(:back) }
    end
  end
  
  def update
    @vacation_calendar_event = VacationCalendarEvent.find(params[:vacation_calendar_event_id])
    respond_to do |format|
      if @vacation_calendar_event.update_attributes(params[:vacation_calendar_event])
        flash[:notice] = l(:notice_successful_update)
        format.html { redirect_back_or_default settings_project_path(@vacation_calendar_event.vacation_calendar.project, :tab => 'vacation_calendar') }
      else
        format.html { render :action => :edit }
      end
    end
  end
end
