class PokemonsController < ApplicationController
    def index
      @pokemons = Pokemon.includes(:type_id).paginate(page: params[:page], per_page: 10)
    end
    def show
      @pokemon = Pokemon.find(params[:id])
    end
  end