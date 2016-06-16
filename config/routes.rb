Rails.application.routes.draw do
  root to: "raw_entries#index"
  resources :raw_entries
  resources :sessions
end
