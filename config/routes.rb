Rails.application.routes.draw do
  get 'lista/index'
  root to: 'lista#index'

  resources :lista do
    resources :items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
