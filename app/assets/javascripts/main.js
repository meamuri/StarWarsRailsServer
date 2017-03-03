$(document).on('click', '.film_sorting', function () {
    $.ajax({
        cache: false,
        data: {
            film: $(this).attr('value')
        },
        url: "/people_ajax",
        success: function (response) {
            $('#result_div').html(response);
        }
    });
});
