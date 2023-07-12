class RecipesController < ApplicationController
	before_action :find_recipe, only: [:show, :edit, :update, :destroy]
	# before_action :authenticate_user!
	before_action :authenticate_user!, except: [:index, :show]

	def index
		
		ids = current_user.friends.map{|f| f.id} << current_user.id 
		

		if params[:friend_filter].present? 
            # @recipe = Recipe.joins(:user).where("user.name ILIKE?", "%#{params[:friend_filter]}%".downcase)
            @recipe = Recipe.searchee(params[:friend_filter])
        	# @recipe = Recipe.joins(:user).where('title ILIKE ?  OR first_name ILIKE ? ',  "%#{search}%", "%#{search}%")
        elsif params[:search].present?
        	@recipe = Recipe.search(params[:search])
        elsif params[:searchIngredients].present?
        	@recipe = Recipe.searchIngredients(params[:searchIngredients])
        elsif params[:category_filter].present? 
        	@recipe = Recipe.searchxx(params[:category_filter])
        else    
           	@recipe = Recipe.where(user_id: ids)
        end

	end

	

	def new
		@recipe = current_user.recipes.build
	end

	def show

	end

	def create
		@recipe = current_user.recipes.build(recipe_params)

		if @recipe.save
	      redirect_to @recipe, notice: "Succesfully created new recipe"
	    else
	      render "new"
	    end
	end

	def edit
	end

	def update
		if @recipe.update(recipe_params)
	      redirect_to @recipe, notice: "Recipe was Succesfully updated !"
	    else
	      render 'edit'
	    end
	end

	def destroy
		@recipe.destroy
    	redirect_to recipes_path, notice:"Succesfully deleted recipe"
	end

	# def search
	# 	query = params[:search]
	# 	results = Recipe.joins(:user).where('title ILIKE ? OR ingredients.name ILIKE ? OR first_name ILIKE ? ',  "%#{search}%",  "%#{search}%", "%#{search}%")
	# 	if params[:filter]  == 'Select'
	# 	 	Recipe.all
	# 	else 
	# 		symbol = params[:filter]
	# 		@recipe = results.where(Recipe.user.first_name = symbol)
	# 	end
	# end


	private

	def recipe_params
		params.require(:recipe).permit(:title, :description, :image, :status, :category_id, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :image, :_destroy])
	end

	def find_recipe
		@recipe = Recipe.find(params[:id])
	end
end
