#require 'projects_helper'

module ProjectsHelperPatch
    unloadable

    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        alias_method_chain :project_settings_tabs, :vacation_calendar
      end
    end

    module InstanceMethods
      def project_settings_tabs_with_vacation_calendar
        tabs = project_settings_tabs_without_vacation_calendar
        tabs << {:name => 'vacation_calendar', :action => :manage_vacation_calendar,:partial => 'projects/settings/manage',
                 :label => :label_manage_vacation_calendar} if User.current.allowed_to?(:manage_vacation_calendar, @project)
        tabs
      end
    end
  end