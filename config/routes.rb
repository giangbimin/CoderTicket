Rails.application.routes.draw do
  root 'events#index'
  get '/upcomming' => 'events#index'

  resources :events do
    resources :tickets
  end
end
