jQuery ->
    $('.states-container').show()

    $('.country-select').on 'change', ->
        load_states_from_country($(this))
    # change
    load_states()
# jQuery

load_states = ->
    for country_select in $('.country-select')
        load_states_from_country(country_select)
    # for
# load_states

load_states_from_country = (country_select) ->
    country = $(country_select).children(':selected')
    address_id = $(country_select).attr('data-address-id')

    $("##{address_id}state-select").hide()
    $("##{address_id}state-select").attr('disabled', 'disabled')
    $("##{address_id}state-select").html('')
    $("##{address_id}state-select").css('margin-bottom', '0')
    $("##{address_id}state-input").hide()
    $("##{address_id}state-input").attr('disabled', 'disabled')

    if country.val() != ''
        $("##{address_id}select-country-first").hide()
        $("##{address_id}loading-states").show()

        $.get "/states/#{country.val()}", (data) ->
            $("##{address_id}loading-states").hide()

            if data != ''
                $("##{address_id}state-select").html(data)
                $("##{address_id}state-select").attr('disabled', false)
                $("##{address_id}state-select").css('margin-bottom', '20px')
                $("##{address_id}state-select").show()
            else
                $("##{address_id}state-input").attr('disabled', false)
                $("##{address_id}state-input").show()
            # if
        # get
    else
        $("##{address_id}select-country-first").show()
        $("##{address_id}loading-states").hide()
    # if
# load_states_from_country
