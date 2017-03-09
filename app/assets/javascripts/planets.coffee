getDataFromServer = ->
  elem = $('#count_of_planets_select option:selected').attr('value')
  $.ajax
    cache: false
    data:
      page: $(this).attr('value')
      count: elem
    url: '/planets_ajax'
    success: (response) ->
      $('#planets_div').html response

$(document).on 'change', $('#count_of_planets_select'), getDataFromServer
$(document).on 'click', '.planets_page', getDataFromServer
