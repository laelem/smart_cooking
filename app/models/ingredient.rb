class Ingredient < ActiveRecord::Base

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  before_validation :strip_attributes
  before_save :format_data

  validates :name,    presence: true,
                      length: { minimum: MIN_SIZE_INGREDIENT,
                                maximum: MAX_SIZE_INGREDIENT },
                      uniqueness: { case_sensitive: false }

  private

    def strip_attributes
      self.name = name.squish unless name.nil?
      self.description = description.squish unless description.nil?
    end

    def format_data
      self.name = name.capitalize
    end

end
