Rails.application.routes.draw do
  resources :events
  devise_for :users
  root 'static_pages#index'
end
