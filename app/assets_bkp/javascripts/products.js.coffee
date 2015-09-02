@configure_product_color = (product_id) ->
    $('#product-colors .color-w').on 'click', ->
        return if $(this).hasClass('zoom-box')

        setTimeout (->
            show_variants()
            load_thumbnails(product_id)
        ), 200

        $('#select-a-product').show()
        $('#product-price').hide()
        $('#add-to-cart-button').attr('disabled', true)
        $('#add-to-cart-button-no-lens').attr('disabled', true)
    # change

    $('#product-variants input[type="radio"]').on 'click', ->
        Spree.showVariantImages @value
        Spree.updateVariantPrice ($ this)

        $('#select-a-product').hide()
        $('#product-price').show()
        $('#add-to-cart-button').attr('disabled', false)
        $('#add-to-cart-button-no-lens').attr('disabled', false)
    # click

    show_variants()
    load_thumbnails(product_id)
# configure_product_color

@load_product_thumbnails = (product_id) ->
    load_thumbnails(product_id)
# load_product_thumbnails

@configure_product_loader = ->
    $('#pagination-link').on 'click', ->
        $('#pagination-link').hide()
        $('#pagination-loading').show()

        if $('#pagination-next-page').text()
            display_next_page()
        # if
    # click
# configure_product_loader

show_variants = ->
    color_id = $('#product-colors .color-w.zoom-box').attr('data-color-id')

    $('#variants-container table').hide()
    $('#variants-container input[type=radio]').prop('checked', false)
    $("#variants-container table[data-color='#{color_id}']").show()
# show_variants

load_thumbnails = (product_id) ->
    show_loading()

    color_id = $('#product-colors .color-w.zoom-box').attr('data-color-id')

    $.get "/products/#{product_id}/thumbnails/#{color_id}", (data) ->
        $('#thumbnails').html(data['html'])

        $('#main-image').data('selectedThumb', $('#thumbnails a').first().attr('href'))
        $('#main-image').data('selectedThumbId', $('#thumbnails a').first().parent().attr('id'))

        $('#main-image img').attr('src', $('#thumbnails a').first().attr('href'))
        $('#main-image a').attr('href', $('#thumbnails a').first().attr('data-large'))

        Spree.addImageHandlers()
    # get
# load_thumbnails

show_loading = ->
    $('#main-image img[itemprop=image]').prop('src', '/images/lightbox/loading.gif')
    $('#thumbnails').html("<img src='/images/lightbox/loading.gif' />")
# show_loading

display_next_page = ->
    $('.pagination-page.invisible').html($('#pagination-next-page').html())
    $('#pagination-next-page').html('')

    $('.pagination-page.invisible').appendTo('#products-list')
    $('.pagination-page.invisible').hide().removeClass('invisible').show(500)

    $('#pagination-loading').hide()
    $('#pagination-link').show()
# display_next_page

load_next_page = ->
    if not $('#pagination-next-page').text()
        # $.get '', (data) ->
        $('#pagination-next-page').html('data')
        # get
    # if
# load_next_page
