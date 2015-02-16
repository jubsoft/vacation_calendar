class CreateVacationCalendarViews < ActiveRecord::Migration
  def up
    create_table :vacation_calendar_views do |t|
      t.string :field_id
      t.belongs_to :vacation_calendar, index:true
    end
    add_index :vacation_calendar_views, :id
  end
  
  def down
    remove_index :vacation_calendar_views, :id
    drop_table :vacation_calendar_views
  end
  
end
