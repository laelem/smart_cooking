class WikiController < ApplicationController

  def autocomplete
    where_clause = 'name ILIKE ?' , "%#{params[:term]}%"
    @data = Ingredient.where('level > 1').where(where_clause).limit(LIMIT_AUTOCOMPLETE)
    @data += Utensil.where(where_clause).limit(LIMIT_AUTOCOMPLETE)
    @data += Skill.where(where_clause).limit(LIMIT_AUTOCOMPLETE)
    @data += CulinaryTerm.where(where_clause).limit(LIMIT_AUTOCOMPLETE)

    @data
      .sort!{|a,b| a.name <=> b.name}
      .map!{|elem| {
        type: get_type(elem),
        class_name: elem.class.name.underscore,
        value: elem.name
      }}

    render json: @data[0...LIMIT_AUTOCOMPLETE]
  end

  def search
    name = params[:wiki_search].to_s.capitalize
    @term = Ingredient.find_by_name(name) \
      || Skill.find_by_name(name) \
      || Utensil.find_by_name(name) \
      || CulinaryTerm.find_by_name(name)
    @type = get_complete_type(@term)
  end


  private

    def get_type(elem)
      type = t(:"wiki.#{elem.class.name.underscore.to_sym}")
      if elem.is_a? Ingredient
        type += ' > ' +
        Ingredient.select(:name).where(level: 1)
        .where('"left" < ? AND "right" > ?', elem.left, elem.right)
        .order(:level).limit(1).first.name
      end
      return type
    end

    def get_complete_type(elem)
      type = [ t(:"wiki.#{elem.class.name.underscore.to_sym}") ]
      if elem.is_a? Ingredient
        Ingredient.select(:name).where('level <> 0')
        .where('"left" < ? AND "right" > ?', elem.left, elem.right)
        .order(:level).each do |categ|
          type << categ
        end
      end
      return type
    end

end
