class SkillDescription < ActiveRecord::Base

  before_validation :strip_attributes

  belongs_to :skill
  validates :skill, presence: true
  validates :description, presence: true

  private

    def strip_attributes
      self.description = description.squish unless description.nil?
    end

end
