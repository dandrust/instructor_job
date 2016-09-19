InstructorJob::Application.routes.draw do

  get "test/new"

root to: 'static_pages#home'
resources :jobs

end
