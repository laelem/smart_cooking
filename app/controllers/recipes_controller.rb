class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    3.times { @recipe.recipe_instructions.new }
    3.times { @recipe.recipe_ingredients.new(ingredient: Ingredient.new) }
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe saved successfully"
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def ingredient_autocomplete
    @data = Ingredient.where('level > 1')
      .where('name ILIKE ?', "%#{params[:term]}%")
      .order(:name).limit(LIMIT_AUTOCOMPLETE)

    @data.map!{|elem| {
        type: get_ingredient_type(elem),
        value: elem.name
      }}

    render json: @data
  end


  private

    def recipe_params
      params.require(:recipe).permit(:name, :dish, :nb_slices, :nb_people,
        :preparation_time, :cooking_time, :complexity, :taste, :balanced_diet,
        :cost, :wine)
    end

    def get_ingredient_type(elem)
      type = ''
      Ingredient.select(:name).where('level <> 0')
      .where('"left" < ? AND "right" > ?', elem.left, elem.right)
      .order(level: :desc).each do |categ|
        type += ' < ' + categ.name
      end
      return type
    end

end
