class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all.sort_by{|likes| likes.thumbs_up_total}.reverse
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(1)
    
    if @recipe.save
      flash[:success] = "your recipes was creatd successfully"
      redirect_to recipes_path
    else
      render :new
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "your recipes was updated successfully"
      redirect_to recipes_path(@recipe)
    else
      render :edit
    end
  end
  
  def like
    @recipe = Recipe.find(params[:id])
    like = Like.create(like: params[:like], chef: Chef.second, recipe: @recipe)
    if like.valid?
      flash[:success] = 'Your Like was successfull'
      redirect_to :back
    else
      flash[:danger] = 'You can only like once'
      redirect_to :back
    end
  end
  
  
  private
    def recipe_params
      params.require(:recipe).permit(:title, :summary, :description, :picture)
    end
  
  
end