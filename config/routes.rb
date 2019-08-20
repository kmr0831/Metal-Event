Rails.application.routes.draw do
  resources :events do
    resources :tickets
  end
  devise_for :users
  root 'static_pages#index'
  
  match '*path' => 'application#error404', via: :all
end
