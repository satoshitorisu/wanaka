Rails.application.routes.draw do
  get 'schedules/index'
  get 'team_users/new'
  get 'team_user/new'
  root :to => "apps#index"
  
  resources :apps
  resources :teams
  resources :schedules
  resources :team_users
  
  devise_for :users
end
