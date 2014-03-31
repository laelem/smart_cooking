class RecipeInstruction < ActiveRecord::Base

  belongs_to :recipe
  before_validation :strip_attributes

  validates :order,         presence: true, numericality: { only_integer: true,
                            greater_than: 0, less_than: MAX_RECIPE_INSTRUCTION }
  validates :instruction,   presence: true, length: { minimum: MIN_SIZE_RECIPE_INSTRUCTION,
                            maximum: MAX_SIZE_RECIPE_INSTRUCTION }

  private

    def strip_attributes
      self.instruction = instruction.squish unless instruction.nil?
    end

end
