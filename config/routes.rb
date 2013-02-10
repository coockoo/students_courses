StudentsCourses::Application.routes.draw do
  # match ':controller(/:action(/:id))(.:format)'
  resources :students, :courses
end
