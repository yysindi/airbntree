Rails.application.routes.draw do
  get 'bookings/create'
  devise_for :users
  root to: 'pages#home'

  resources :treehouses do
    resources :bookings, only: [:create, :new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
