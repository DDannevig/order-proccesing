Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products, param: :identifier
  resources :deposits, only: %i[create index destroy]
  resources :orders, only: %i[create index update]
end
