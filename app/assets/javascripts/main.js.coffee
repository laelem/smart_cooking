class App
  constructor: ->
    @bindEvents()

  bindEvents: ->
    $('#wiki_nav_link').on('click', @toggle_wiki_searchbar)
    $('#wiki_search').on('keyup focus', @wiki_search)

    $('#form_recipe .input_ingredient').on('keyup focus', @ingredient_search)
    $('#form_recipe .spec i').on(
      {mouseenter: @recipe_spec_in, mouseleave: @recipe_spec_out, click: @recipe_spec_select})
    $('#form_recipe .spec .indifferent').on('click', @recipe_spec_select_indifferent)
    $('#form_recipe .spec i').tooltip({
      tooltipClass: "tooltip"
      show: false
      position: {my: 'center top-20', at: 'center top-20'}
    })
    $('#form_recipe .radio li').on('click', @dish_select)

  toggle_wiki_searchbar: (e) ->
    e.preventDefault()
    $('#wiki_search_form').toggle()
    $('#wiki_search').focus()

  wiki_search: ->
    $(this).autocomplete({
      minLength: 1
      delay: 0
      source: (request, response) ->
        $.ajax
          type: 'post'
          url: '/wiki/autocomplete'
          data: { term: request.term }
          success: (data) -> response(data)
      focus: (event, ui) ->
        $("#wiki_search").val(ui.item.value)
        return false
      select: (event, ui) ->
        $("#wiki_search_form").submit()
        return false
    })
    .data("ui-autocomplete")._renderItem = (ul, item) ->
      val = item.value.replace(new RegExp(this.term, "gi"), "<em>$&</em>")
      return $("<li class=\"#{item.class_name}\">")
        .append("<a>#{val}<div class=\"type\">#{item.type}</div></a>")
        .appendTo(ul.addClass('wiki_results'))

  ingredient_search: ->
    input = this
    $(input).autocomplete({
      minLength: 1
      delay: 0
      source: (request, response) ->
        $.ajax
          type: 'post'
          url: '/recipes/ingredient_autocomplete'
          data: { term: request.term }
          success: (data) -> response(data)
      focus: (event, ui) ->
        $(input).val(ui.item.value)
        return false
      select: (event, ui) ->
        $(input).val(ui.item.value)
        return false
    })
    .data("ui-autocomplete")._renderItem = (ul, item) ->
      value = item.value.replace(new RegExp(this.term, "gi"), "<em>$&</em>")
      return $("<li>")
        .append("<a>#{value}<span class=\"type\">#{item.type}</span></a>")
        .appendTo(ul)

  recipe_spec_in: ->
    $(this).addClass('hover')
    $(this).prevAll().addClass('hover')

  recipe_spec_out: ->
    $(this).parent().children().removeClass('hover')

  recipe_spec_select: ->
    $(this).nextAll().removeClass('active')
    $(this).addClass('active')
    $(this).prevAll().addClass('active')
    $(this).parent().next().removeClass('active')
    $(this).parent().parent().find('input').val($(this).attr('data-value'))

  recipe_spec_select_indifferent: ->
    $(this).prev().children().removeClass('active')
    $(this).addClass('active')
    $(this).parent().parent().find('input').val($(this).attr(''))

  dish_select: ->
    $(this).parent().children().removeClass('active')
    $(this).addClass('active')

jQuery ($) ->
  app = new App()
