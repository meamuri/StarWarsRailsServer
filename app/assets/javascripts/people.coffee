@getPeopleByFilm = ->
  $.ajax
    cache: false
    data:
      film: $('#result_div').attr('value')
      order: $('#sort_people_param option:selected').attr('value')
    url: '/people_ajax'
    success: (response) ->
      $('#result_div').html response


$(document).on 'click', '.film_sorting', ->
  nowWeShowFilmById = $(this).attr('value')
  $('#result_div').attr('value', nowWeShowFilmById)
  getPeopleByFilm()

$(document).on 'change', '#sort_people_param', getPeopleByFilm