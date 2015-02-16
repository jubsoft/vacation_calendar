class VacationCalendarViewController < ApplicationController
  unloadable

  def new
    @vacation_calendar_view= VacationCalendarView.new
    @vacation_calendar_view.vacation_calendar_id=params[:vacation_calendar_id]
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @vacation_calendar_view = VacationCalendarView.new(params[:vacation_calendar_view])
    respond_to do |format|
      if @vacation_calendar_view.save
        flash[:notice] = l(:notice_successful_create)
        format.html { redirect_back_or_default settings_project_path(@vacation_calendar_view.vacation_calendar.project, :tab => 'vacation_calendar') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def edit
    @vacation_calendar_view = VacationCalendarView.find(params[:vacation_calendar_view_id])
    respond_to do |format|
      format.html
    end
  end
  
  def destroy
    @vacation_calendar_view = VacationCalendarView.find(params[:id])
    @vacation_calendar_view.destroy
    respond_to do |format|
      flash[:notice] = l(:notice_successful_delete)
      format.html { redirect_to(:back) }
    end
  end
  
  def update
    @vacation_calendar_view = VacationCalendarView.find(params[:vacation_calendar_view_id])
    respond_to do |format|
      if @vacation_calendar_view.update_attributes(params[:vacation_calendar_view])
        flash[:notice] = l(:notice_successful_update)
        format.html { redirect_back_or_default settings_project_path(@vacation_calendar_view.vacation_calendar.project, :tab => 'vacation_calendar') }
      else
        format.html { render :action => :edit }
      end
    end
  end
end
