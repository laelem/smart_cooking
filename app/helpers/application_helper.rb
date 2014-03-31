module ApplicationHelper

  def ingredients_nested_list(ingredients)
    current_level = 1
    str = '<ul>'
    ingredients.each_with_index do |ing, i|
      (current_level - ing.level).times do
        str += '</ul>'
      end
      current_level = ing.level
      if ing.right - ing.left > 1
        str += '<li>' + ing.name + '<ul>'
      else
        str += '<li>' + ing.name + '</li>'
      end
    end
    current_level.times do
      str += '</ul>'
    end
    return str.html_safe
  end
end
