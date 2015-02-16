require 'projects_helper_patch'
require 'issue_category_patch'
require 'issue_status_patch'

Redmine::Plugin.register :redmine_vacation_calendar do
  name 'Redmine Vacation Calendar plugin'
  author 'APiotr Zięba'
  description 'This is a plugin for Redmine'
  version '0.1.0'
  
  project_module :vacation_calendar do
    permission :show_vacation_calendar, :vacation_calendar => :show
    permission :manage_vacation_calendar, :vacation_calendar => :manage
  end
  menu :project_menu, :vacation_calendar, { :controller => 'vacation_calendar', :action => 'show'}, :caption => 'Kalendarz urlopowy', :after => :calendar 
  
    
  Rails.configuration.to_prepare do  
    unless IssueStatus.include?(IssueStatusPatch)
      IssueStatus.send(:include, IssueStatusPatch)
    end
    unless IssueCategory.include?(IssueCategoryPatch)
      IssueCategory.send(:include, IssueCategoryPatch)
    end
    unless ProjectsHelper.include?(ProjectsHelperPatch)
      ProjectsHelper.send(:include, ProjectsHelperPatch)
    end
    unless Project.include?(ProjectPatch)
      Project.send(:include, ProjectPatch)
    end
  end  
end
