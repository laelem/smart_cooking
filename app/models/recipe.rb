class Recipe < ActiveRecord::Base

# Relations

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients
  # validates_associated :recipe_ingredients
  # validates :recipe_ingredients, presence: true

  has_many :recipe_instructions
  accepts_nested_attributes_for :recipe_instructions
  validates_associated :recipe_instructions


# Callbacks

  before_validation :strip_attributes
  before_save :format_data


# Validations

  validates :name,          presence: true,
                            length: { minimum: MIN_SIZE_RECIPE_NAME,
                                maximum: MAX_SIZE_DEFAULT_INPUT_TEXT }
  validates :dish,          inclusion: RECIPE_DISH, allow_nil: true
  validates :nb_slices,     numericality: {
                              only_integer: true,
                              greater_than: 0, less_than: MAX_RECIPE_NB_SLICES_OR_PEOPLE },
                            allow_nil: true
  validates :type_slices,   inclusion: RECIPE_TYPE_SLICES, allow_nil: true
  validates :preparation_time, numericality: {
                              only_integer: true,
                              greater_than: 0, less_than: MAX_RECIPE_PREPARATION_TIME },
                            allow_nil: true
  validates :cooking_time,  numericality: {
                              only_integer: true,
                              greater_than: 0, less_than: MAX_RECIPE_COOKING_TIME },
                            allow_nil: true
  validates :complexity,    inclusion: RECIPE_COMPLEXITY, allow_nil: true
  validates :taste,         inclusion: RECIPE_TASTE, allow_nil: true
  validates :balanced_diet, inclusion: RECIPE_BALANCED_DIET, allow_nil: true
  validates :cost,          inclusion: RECIPE_COST, allow_nil: true
  validates :wine,          length: { minimum: MIN_SIZE_RECIPE_WINE,
                                maximum: MAX_SIZE_RECIPE_WINE },
                            allow_nil: true

    # t.string  "continent"
    # t.string  "country"
    # t.string  "city"

  def Recipe.test_record
    ing = IngredientRecipe.new(

    )
    Recipe.new(
      name: "Brownies classiques",
      dish: "dessert",
      nb_slices: 18,
      complexity: "easy",
      taste: "medium",
      balanced_diet: "caloric",
      cost: "cheap",
      preparation_time: 30,
      cooking_time: 35,
      wine: "Muscat"
    )
  end

  private

    def strip_attributes
      self.name = name.squish unless name.nil?
      self.wine = wine.squish unless wine.nil?
    end

    def format_data
      self.name = name.capitalize
    end

end
