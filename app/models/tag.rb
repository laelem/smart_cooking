class Tag < ActiveRecord::Base

  before_validation :strip_attributes
  before_save :format_data

  validates :name,    presence: true,
                      length: { minimum: MIN_SIZE_TAG,
                                maximum: MAX_SIZE_TAG },
                      uniqueness: { case_sensitive: false }

  private

    def strip_attributes
      self.name = name.squish unless name.nil?
    end

    def format_data
      self.name = name.capitalize
    end

end
