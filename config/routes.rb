Rails.application.routes.draw do
  root to: 'pages#home'
  resources :events
  resources :bios, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :contacts, only: [:index]
  resources :bibs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
