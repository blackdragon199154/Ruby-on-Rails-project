$ ->
    Spree.addImageHandlers = ->
        thumbnails = ($ '#product-images #thumbnails')
        ($ '#main-image').data 'selectedThumb', ($ '#main-image img').attr('src')
        thumbnails.find('.single-view').eq(0).addClass 'selected'
        thumbnails.find('a').on 'click', (event) ->
            ($ '#main-image').data 'selectedThumb', ($ event.currentTarget).attr('href')
            ($ '#main-image').data 'selectedThumbId', ($ event.currentTarget).parent().attr('id')
            ($ '#main-image img').attr 'src', ($ event.currentTarget).attr('href')
            ($ '#main-image a').attr 'href', ($ event.currentTarget).attr('data-large')

            ($ this).mouseout ->
                thumbnails.find('.single-view').removeClass 'selected'
                ($ event.currentTarget).parent('li').addClass 'selected'
            false
        # click
    # Spree.addImageHandlers

    Spree.showVariantImages = (variantId) ->
        ($ '.single-view.vtmb').hide()
        ($ '.single-view.tmb-' + variantId).show()
        currentThumb = ($ '#' + ($ '#main-image').data('selectedThumbId'))
        if not currentThumb.hasClass('vtmb-' + variantId)
            thumb = ($ ($ '#thumbnails .single-view:visible.vtmb').eq(0))
            thumb = ($ ($ '#thumbnails .single-view:visible').eq(0)) unless thumb.length > 0
            newImg = thumb.find('a').attr('href')
            ($ '#thumbnails .single-view').removeClass 'selected'
            thumb.addClass 'selected'
            ($ '#main-image img').attr 'src', newImg
            ($ '#main-image').data 'selectedThumb', newImg
            ($ '#main-image').data 'selectedThumbId', thumb.attr('id')
    # Spree.showVariantImages

    Spree.updateVariantPrice = (variant) ->
        variantPrice = variant.data('price')
        ($ '.price.selling').text(variantPrice) if variantPrice
    # Spree.updateVariantPrice
    radios = ($ '#product-variants input[type="radio"]')

    if radios.length > 0
        Spree.showVariantImages ($ '#product-variants input[type="radio"]').eq(0).attr('value')
        Spree.updateVariantPrice radios.first()
    # if

    Spree.addImageHandlers()

    # radios.click (event) ->
    #     Spree.showVariantImages @value
    #     Spree.updateVariantPrice ($ this)
    # # click
# $
