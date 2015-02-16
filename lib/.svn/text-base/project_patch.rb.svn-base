#require 'project'


  module ProjectPatch
    unloadable

    def self.included(base)
      base.class_eval do
        has_one :vacation_calendar, :dependent => :destroy
        #accepts_nested_attributes_for :custom_workflow, :update_only => true
      end
    end
  end
