Rails.application.routes.draw do

  get "/geolocation/current", to: "geolocations#show", as: :geolocation
  get "/geocoding/current", to: "geocodings#show", as: :geocoding
  get "/chipotle/closest", to: "places#show", as: :place
  resources :places, only: [:new]

  root to: "sessions#new"

  get "/auth/google_oauth2", as: :google_login
  get "/auth/google_oauth2/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

end
