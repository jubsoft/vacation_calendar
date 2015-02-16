module VacationCalendarViewHelper
  def getIssueFieldsForView
    issueFieldsForVie=@vacation_calendar_view.vacation_calendar.project.issue_custom_fields.collect  {|t| [t.name, t.id]}
    test=Issue.columns
    issueFieldsForVie+=Issue.columns.collect {|t| [ t.name, t.name]} 
  end
end
