# TODO move to prescription.js
jQuery ->
    $('form.frame_line_item .panel-collapse').on 'show.bs.collapse', ->
        $("form.frame_line_item input[type=radio][data-target=##{$(this).attr('id')}]").prop('checked', true);
    # shown

    $('form.frame_line_item .panel-collapse').on 'hide.bs.collapse', ->
        $("form.frame_line_item input[type=radio][data-target=##{$(this).attr('id')}]").prop('checked', false);
    # hide

    for radio in $('form.frame_line_item input[type=radio][name="frame_line_item[prescription][chosen_method]"]')
        if $(radio).is(':checked')
            $($(radio).attr('data-target')).collapse('show')
        # if
    # for

    $('form.frame_line_item input[type=hidden], form.frame_line_item input[type=radio][data-toggle=collapse], form.frame_line_item select').on 'change', ->
        update_lens_list()
    # change
    update_lens_list()

    $('.select2').select2({width: '100%'});
# jQuery

# TODO remove
update_lens_list = ->
    $('#select-prescription-first').show()
    $('#no-lenses').hide()
    $('#loading-lenses-list').hide()

    $('#select-lens-wrapper').show()

    return if $('form.frame_line_item input[type=checkbox]:checked').length == 0

    for select in $('form.frame_line_item select')
        if $(select).hasClass('left-eye')
            return if $('form.frame_line_item input.left-eye[type=checkbox]').is(':checked') and $(select).val() == ''
        else if $(select).hasClass('right-eye')
            return if $('form.frame_line_item input.right-eye[type=checkbox]').is(':checked') and $(select).val() == ''
        # if
    # for

    $('#select-prescription-first').hide()
    $('#no-lenses').hide()
    $('#loading-lenses-list').show()

    $('.lens-select').hide()
    $('.lens-select input[type=radio]').attr('disabled', 'disabled')

    $.get "/options/allowed_lenses.json?#{$('form.frame_line_item').serialize()}", (data) ->
        $('#loading-lenses-list').hide()

        if data['invalid'] == true
            $('#select-prescription-first').show()
        else
            no_lenses = true
            for lens_id in data
                no_lenses = false if $("#lens-#{lens_id}").length > 0

                $("#lens-#{lens_id}.lens-select").show()
                $("#lens-#{lens_id}.lens-select input[type=radio]").removeAttr('disabled')
            # for

            if no_lenses
                $('#no-lenses').show()
            else
                $('#select-lens-wrapper').hide()
            # if
        # if
    # get
# update_lens_list
