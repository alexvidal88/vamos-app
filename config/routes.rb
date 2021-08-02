Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'community', to: 'pages#community'

  resources :forecast_results
  resources :weather_searches
  resources :search_parameters
  resources :parameters
end
