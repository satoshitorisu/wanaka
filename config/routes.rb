Rails.application.routes.draw do
  root :to => "apps#index"

  get '/apps/about' => 'apps#about', as: 'app_about'

  get '/apps/message' => 'apps#message', as: 'app_message'
  get '/apps/team' => 'apps#team', as: 'app_team'
  get '/apps/schedule' => 'apps#schedule', as: 'app_schedule'
  get '/apps/game' => 'apps#game', as: 'app_game'
  get '/apps/profile' => 'apps#profile', as: 'app_profile'

  get '/schedules/manage' => 'schedules#manage', as: 'schedules_manage'
  get '/team/manage/:id' => 'teams#manage', as: 'team_manage'

  get 'team/apply2team' => 'team_users#apply', as: 'apply_to_team'
  get 'team/invite2team' => 'team_users#invite', as: 'invite_to_team'

  # resources :users, only: [:show]
  resources :apps
  resources :teams
  resources :schedules
  resources :team_users
  resources :games

  devise_for :users
end
