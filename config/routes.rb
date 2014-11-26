BaltimorePublicArtCommons::Application.routes.draw do
  resources :items, only: [:index, :show]
  resources :artists, only: [:index]
  resources :sessions, only: [:create, :new]

  get 'static_pages/about', to: 'static_pages#about', as: 'about', path: '/about'

  get '/login', to: 'sessions#new', as: 'login'

  root 'items#index'
end
