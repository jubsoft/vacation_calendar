# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'vacation_calendar/get_events', :to=>'vacation_calendar#get_events'
resources :vacation_calendar
resources :vacation_calendar_event
resources :vacation_calendar_view


#get 'vacation_calendar/show', :to => 'vacation_calendar#show'

#get 'vacation_calendar_event/new', :to=>'vacation_calendar_event#new'
#get 'vacation_calendar_event/create', :to=>'vacation_calendar_event#create'
#post 'vacation_calendar_event/create', :to=>'vacation_calendar_event#create'
#put 'vacation_calendar_event/update', :to=>'vacation_calendar_event#update'
#get 'vacation_calendar_event/edit', :to=>'vacation_calendar_event#edit'
#delete 'vacation_calendar_event', :to=>'vacation_calendar_event#destroy'
#get 'vacation_calendar/manage', :to => 'vacation_calendar#manage'
#get 'projects/manage', :to => 'vacation_calendar#manage'
#get 'projects/:id/show', :to => 'projects#show'

#post 'post/:id/vote', :to => 'polls#vote'