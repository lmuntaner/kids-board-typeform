Rails.application.routes.draw do
  root to: "static_pages#index"

  resources :dashboards, only:[:new, :create, :show]

  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
