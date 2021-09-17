Rails.application.routes.draw do
  resources :event_attachments
  devise_for :users
  root to: 'pages#home'
  resources :events
  resources :bios, only: [:index, :new, :create, :edit, :update, :destroy]
  get '/contact', to: 'pages#contact', as: 'contact'
  resources :attachments, only: [:index, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
