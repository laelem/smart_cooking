class StaticPagesController < ApplicationController

  def home
    @ing = Ingredient.where('level > 0')
  end
end
