Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
    resources :pokemons, only: [:index]
    resources :pokemons, only: [:index, :show, :edit, :update, :delete, :destroy]
end
