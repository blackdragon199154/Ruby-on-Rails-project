jQuery ->
    setTimeout (-> $('#update-cart .line-item-add-on').each ->
        height_difference = $("##{$(this).attr('data-add-on-id')}").height() - $(this).height()
        $(this).css('margin-top', parseInt($(this).css('margin-top'))+height_difference) if height_difference > 0), 1000
    # for

    $('.cart a.popover-link').popover({
        trigger: 'manual',
        placement: 'bottom',
        html: true,
        container: 'body',
        content: (-> $('#cart-content').html()),
    })

    $('.cart a.popover-link').on 'click', (e) ->
        e.preventDefault()

        $('.cart a.popover-link').popover('toggle')

        return false
    # click
# jQuery
