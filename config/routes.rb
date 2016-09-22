InstructorJob::Application.routes.draw do

root                to: 'static_pages#home'
get '/instructor',  to: 'static_pages#instructor'
get '/admin',       to: 'static_pages#admin'

resources :jobs, only: [:create, :update]
resources :apps, only: [:create]

end
