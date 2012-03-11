$ = jQuery.sub()

$.fn.item_id = ->
  $(@).data('id') or $(@).parents('[data-id]').data('id')

window.$ = $
