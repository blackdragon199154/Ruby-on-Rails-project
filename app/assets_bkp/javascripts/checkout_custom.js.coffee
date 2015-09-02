@configure_checkout_summary = ->
    position = $('#checkout-summary').offset().top unless position
    $('#checkout-summary').affix({offset: {top: position}})
# configure_checkout_summary
