class Skill < ActiveRecord::Base

  before_validation :strip_attributes
  before_save :format_data

  has_many :skill_descriptions

  validates :name,    presence: true,
                      length: { minimum: MIN_SIZE_SKILL,
                                maximum: MAX_SIZE_DEFAULT_INPUT_TEXT },
                      uniqueness: { case_sensitive: false }

  private

    def strip_attributes
      self.name = name.squish unless name.nil?
      self.skill_descriptions.each do |desc|
        self.send("#{desc}=", self.send("#{desc}").squish) unless self.send("#{desc}").nil?
      end
    end

    def format_data
      self.name = name.capitalize
    end

end
