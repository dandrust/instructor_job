InstructorJob::Application.routes.draw do

root                to: 'static_pages#home'
get '/instructor',  to: 'static_pages#instructor'
get '/admin',       to: 'static_pages#admin'

resources :jobs, :apps, only: [:create, :update]

end
