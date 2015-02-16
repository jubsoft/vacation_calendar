class CreateVacationCalendarEvents  < ActiveRecord::Migration
  def up
    create_table :vacation_calendar_events do |t|
      t.string :color
      t.string :textColor
      t.references :issue_category
      t.references :status
      t.belongs_to :vacation_calendar, index:true
    end
    add_index :vacation_calendar_events, :id
    add_index :vacation_calendar_events, :issue_category_id
    add_index :vacation_calendar_events, :status_id
  end
  
  def down
    remove_index :vacation_calendar_events, :id
    remove_index :vacation_calendar_events, :issue_category_id
    remove_index :vacation_calendar_events, :status_id
    drop_table :vacation_calendar_events
  end
end
