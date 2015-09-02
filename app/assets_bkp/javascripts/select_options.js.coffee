jQuery ->
    $('form.frame_line_item .remove-lens-protection').on 'click', ->
        remove_lens_protection($(this).attr('data-lens-protection-id'))
        $(this).hide()
    # click

    $('form.frame_line_item .lens-protection-option').on 'click', ->
        check_lens_protection_option(this)
    # click

    for radio in $('form.frame_line_item .lens-protection-option')
        check_lens_protection_option(radio)
    # for

    $('form.frame_line_item .lens-thickness-option').on 'click', ->
        update_lens_thickness_price(this)
    # click
    update_lens_thickness_price()

    $('form.frame_line_item .lens-protection-option').on 'click', ->
        update_lens_protection_price(this)
    # click
    update_lens_protection_price()

    adjust_lens_thickness_height()
    adjust_lens_protection_height()
# jQuery

remove_lens_protection = (lens_protection_id) ->
    $("form.frame_line_item input[type=radio][name='frame_line_item[lens_protection_options][#{lens_protection_id}]']").prop('checked', false)
# remove_lens_protection

check_lens_protection_option = (option) ->
    if $(option).closest('.lens-protection').find('.lens-protection-option').is(':checked')
        $(option).closest('.lens-protection').find('.remove-lens-protection').show()
    else
        $(option).closest('.lens-protection').find('.remove-lens-protection').hide()
    # if
# check_lens_protection_option

update_lens_thickness_price = (option=null) ->
    if option
        $(option).closest('.lens-thickness').children('.price').html($(option).attr('data-thickness-price'))
    else
        for radio in $('form.frame_line_item .lens-thickness-option:checked')
            $(radio).closest('.lens-thickness').children('.price').html($(radio).attr('data-thickness-price'))
        # for
    # if
# update_lens_thickness_price

update_lens_protection_price = (option=null) ->
    if option
        $(option).closest('.lens-protection').children('.price').html($(option).attr('data-protection-price'))
    else
        for radio in $('form.frame_line_item .lens-protection-option:checked')
            $(radio).closest('.lens-protection').children('.price').html($(radio).attr('data-protection-price'))
        # for
    # if
# update_lens_protection_price

adjust_lens_thickness_height = ->
    max_height = -1
    for lens_thickness in $('form.frame_line_item .lens-thickness')
        max_height = Math.max(max_height, parseInt($(lens_thickness).css('height')))
    # for

    $('form.frame_line_item .lens-thickness').css('height', max_height)
# adjust_lens_thickness_height

adjust_lens_protection_height = ->
    max_height = -1
    for lens_protection in $('form.frame_line_item .lens-protection')
        max_height = Math.max(max_height, parseInt($(lens_protection).css('height')))
    # for

    $('form.frame_line_item .lens-protection').css('height', max_height)
# adjust_lens_protection_height
