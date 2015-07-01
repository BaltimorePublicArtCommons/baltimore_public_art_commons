BaltimorePublicArtCommons::Application.routes.draw do

  root 'items#index'

  resources :items, only: [:index, :show]
  resources :artists, only: [:index, :show]
  resources :sessions, only: [:create, :new]
  resources :users, only: [:new, :create, :edit, :update]

  get 'static_pages/about', to: 'static_pages#about', as: 'about', path: '/about'

  get '/login', to: 'sessions#new', as: 'login'

end
