Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
    resources :types, only: [:category, :search]
    get '/categories/:type_id', to: 'pokemons#category', as: 'category'
    resources :pokemons, only: [:index, :show, :edit, :update, :search, :delete, :destroy]
end
