Rails.application.routes.draw do
  get '/upcoming' => 'events#index'
  root 'events#index'

  resources :events do
    resources :tickets
  end
end
