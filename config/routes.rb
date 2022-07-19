Rails.application.routes.draw do
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :users, only: %i[index show create edit update destroy]
  resources :spendings, only: %i[index show new create edit update destroy]
  resources :share_spendings, only: %i[index]
  root 'welcome#index'
end
