@configure_taxon_collapse = ->
    $('#taxon-sidebar .collapse').on 'shown.bs.collapse', ->
        $("[href=##{$(this).attr('id')}]").children('span').text('close')
    # shown.bs.collapse

    $('#taxon-sidebar .collapse').on 'hidden.bs.collapse', ->
        $("[href=##{$(this).attr('id')}]").children('span').text('open')
    # hidden.bs.collapse

    for accordion in $('#taxon-sidebar .accordion-filters')
        if $(accordion).find('input[type=checkbox]:checked').length > 0
            $("#{$(accordion).find('a[data-toggle=collapse]').attr('href')}").collapse('show')
        # if
    # for
# configure_taxon_collapse
