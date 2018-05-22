Rails.application.routes.draw do
  root to: 'searches#new'
  resources :searches
  resources :events, only: :show
end
