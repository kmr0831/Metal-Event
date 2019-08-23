Rails.application.routes.draw do
  resources :events do
    resources :tickets
    resources :likes, only: [:create, :destroy]
  end
  devise_for :users
  root 'static_pages#index'
  #get 'categories/:id', to: 'categories#show'
  resources :categories, only: :show
  match '*path' => 'application#error404', via: :all
end
