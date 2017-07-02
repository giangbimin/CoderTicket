Rails.application.routes.draw do
  get '/upcoming' => 'events#index'
  root 'events#index'

  resources :events do
    resources :tickets
  end
  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
