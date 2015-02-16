class CreateVacationCalendars < ActiveRecord::Migration
  def up
    create_table :vacation_calendars do |t|
      t.references :project
    end
    add_index :vacation_calendars, :id
    add_index :vacation_calendars, :project_id
  end
  
  def down
    remove_index :vacation_calendars, :id
    remove_index :vacation_calendars, :project_id
    drop_table :vacation_calendars
  end
end
