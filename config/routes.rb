StudentsCourses::Application.routes.draw do
  devise_for :students

  # match ':controller(/:action(/:id))(.:format)'
  resources :students, :courses
end
