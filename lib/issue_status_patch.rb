#require 'project'


  module IssueStatusPatch
    unloadable

    def self.included(base)
      base.class_eval do
        has_many :vacation_calendar_event, :dependent => :destroy
        #accepts_nested_attributes_for :custom_workflow, :update_only => true
      end
    end
  end
