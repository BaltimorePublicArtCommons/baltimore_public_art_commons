BaltimorePublicArtCommons::Application.routes.draw do
  resources :items, only: [:index, :show]

  get 'static_pages/about', to: 'static_pages#about', as: 'about', path: '/about'
  get 'static_pages/home', to: 'static_pages#home', as: 'home', path: ''

  root 'static_pages#home'
end
