@configure_slider = ->
    $('#slider').on 'slide.bs.carousel', (e) ->
        $('#slider .item').css('z-index', 1)

        $(e.relatedTarget).hide()
        $(e.relatedTarget).css('z-index', 2)
        $(e.relatedTarget).show()
    # slide.bs.carousel
# configure_slider
