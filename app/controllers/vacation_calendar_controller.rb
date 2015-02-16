class VacationCalendarController < ApplicationController
  
  def show
    @project = Project.find(params[:id])
    @vacationCalendar = VacationCalendar.find_by_project_id(@project.id)
  end
  
  def new
  end
  
  def create
  end
  
  def get_events
     @project = Project.find(params[:project_id])
     paramser=params
     issues= Issue.where( "project_id = ? and ( due_date >= ? and start_date <= ? )", @project.id, params[:start], params[:end] )
     events=[]
     vacation_calendar=VacationCalendar.find_by_project_id(@project.id)
     color_events = vacation_calendar.vacation_calendar_events
     
     for issue in issues
        event={'title'=> 'Autor: '+issue.author.name.to_s.html_safe, 'url' => '/issues/'+issue.id.to_s } 
        if !(issue.category.nil?)
          event['title']+= ' Kategoria: '+ issue.category.name
        end
        if !(issue.start_date.nil?)
          event['start']=issue.start_date.to_s
        end
        if !(issue.due_date.nil?)
          event['end']=(issue.due_date+1.day).to_s
        end
        if !(color_events.nil?) and !(issue.category.nil?) and (color_events.where("issue_category_id = ? AND status_id= ?", issue.category.id, issue.status.id)).any?
          event['color']=color_events.where("issue_category_id = ? AND status_id= ?", issue.category.id, issue.status.id).first.color.to_s
          event['textColor']=color_events.where("issue_category_id = ? AND status_id= ?", issue.category.id, issue.status.id).first.textColor.to_s
        end
        events<< event
     end
     respond_to do |format|
       format.json  { render :json => events }
     end
  end
  
end
