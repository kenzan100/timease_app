Rails.application.routes.draw do
  root to: "entries#index"
  resources :entries, only: [:index, :create]
  resources :sessions
end
