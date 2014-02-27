BaltimorePublicArtCommons::Application.routes.draw do
  resources :items, only: [:index, :show]

  get 'static_pages/about', to: 'static_pages#about', as: 'about', path: '/about'

  root 'items#index'
end
