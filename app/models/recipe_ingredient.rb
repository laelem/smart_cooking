class RecipeIngredient < ActiveRecord::Base
  set_primary_keys :ingredient_id, :recipe_id

  belongs_to :ingredient
  belongs_to :recipe
  validates_associated :ingredient
  accepts_nested_attributes_for :ingredient

  validates :quantity,    numericality: {
                            greater_than: 0, less_than: MAX_INGREDIENT_RECIPE_QUANTITY },
                          allow_nil: true
  validates :measure,     inclusion: RECIPE_MEASURE, allow_nil: true

end
