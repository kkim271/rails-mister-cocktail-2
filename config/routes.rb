Rails.application.routes.draw do
  resources :cocktail, only: [:index, :show, :new, :create, :destroy] do
    resources :dose, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
