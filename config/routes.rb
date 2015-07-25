Rails.application.routes.draw do
  root to: "static_pages#index"
  post 'users/:user_id/setup_forms' => 'dashboards#create'

  resources :dashboards, only:[:new, :index]

  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resource :setup_form
end
