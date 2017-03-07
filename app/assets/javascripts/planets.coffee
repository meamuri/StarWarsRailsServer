$(document).on 'click', '.planets_page', ->
  $.ajax
    cache: false
    data: page: $(this).attr('value')
    url: '/planets_ajax'
    success: (response) ->
      $('#planets_div').html response
      return
  return