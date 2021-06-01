Rails.application.routes.draw do
  get 'bookings/create'
  devise_for :users
  root to: 'pages#home'
<<<<<<< HEAD

  resources :treehouses do
=======
  get 'profile', to: 'pages#profile'
  resources :treehouses do 
>>>>>>> 9efc78de29d68084bb77a349e962e1c652fe10c4
    resources :bookings, only: [:create, :new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
