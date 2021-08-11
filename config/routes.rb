Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :events
  resources :bios, only: [:index, :new, :create, :edit, :update, :destroy]
  get '/contact', to: 'pages#contact', as: 'contact'
  resources :bibs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
