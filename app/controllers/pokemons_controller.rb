class PokemonsController < ApplicationController
    def index
      @pokemons = Pokemon.includes(:type_id).paginate(page: params[:page], per_page: 10)
    end
    def show
      @pokemon = Pokemon.find(params[:id])
    end

    def edit
      @pokemon = Pokemon.find(params[:id])
    end

    def destroy
      @pokemon = Pokemon.find(params[:id])
      @pokemon.destroy
      redirect_to pokemons_path, notice: "Pokemon was successfully deleted."
    end

    def category
      @type = Type.find(params[:type_id])
      @pokemons = Pokemon.where("type1 = ? OR type2 = ?", @type.id, @type.id).paginate(page: params[:page], per_page: 10)
    end  
    
    def search
      keyword = params[:keyword]
      @pokemons = Pokemon.where("name LIKE ?", "%#{keyword}%")
    end

    def update
      @pokemon = Pokemon.find(params[:id])
    
      if @pokemon.update(pokemon_params)
        redirect_to @pokemon, notice: "Pokemon was successfully updated."
      else
        flash.now[:alert] = "Failed to update the Pokemon."
        render :edit
      end
    end

    private

    def pokemon_params
      params.require(:pokemon).permit(:name, :HP, :ATK, :DEF, :SA, :SD, :SP)
    end
    
  end