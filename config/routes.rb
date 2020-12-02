Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'rakutens#index'
  get 'rakutens/search' => 'rakutens#search'
  resources :rakutens
  resources :posts
  get "rakutens/new" => 'rakutens#new'
  get 'devise/session' => 'dvise#sessions#new'
end
