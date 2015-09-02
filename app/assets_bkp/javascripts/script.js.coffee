jQuery ->
    for input_with_error in $('.field_with_errors')
        $(input_with_error).parent('.form-input-wrapper').addClass('field_with_errors')
    # for

    $('.pullup').on 'click', (e) ->
        $('.footer-links').slideToggle(400)
        $('html, body').animate({scrollTop: $(document).height()}, 400)
        $('.pullup span').toggleClass('icon-long-arrow-up')

        e.preventDefault()
        return false
    # click

    $('.opener').on 'click', (e) ->
        $('.mobile-nav-dropdown').slideToggle(100)
        e.preventDefault()
    # click

    $('#countries').msDropdown()
    $('#countries-flag').msDropdown()

    $('.zoomin').on 'click', (e) ->
        e.preventDefault()
        $(this).closest('.details-img').toggleClass('zoom-box')
        srcImg = $(this).prop('src').split('/')
        srcLen = srcImg.length - 1
        if srcImg[srcLen] == 'zoomin.png'
            srcImg[srcLen] = 'zoomout.png'
            realSrc = srcImg.join('/')
            $(this).prop('src', realSrc)
        else
            srcImg[srcLen] = 'zoomin.png'
            realSrc = srcImg.join('/')
            $(this).prop('src', realSrc)
        # if
    # click

    $('.color-w').on 'click', (e) ->
        e.preventDefault()
        $(this).siblings().removeClass('zoom-box')
        if $(this).hasClass('disable-unclick')
            $(this).addClass('zoom-box')
        else
            $(this).toggleClass('zoom-box')
        # if
    # click

    $('.quick_search').on 'click', 'input[type=checkbox]', ->
        if $(this).is(':checked')
            $(this).parent().siblings('p').css({
                'border' : '1px dotted #ccc',
                'padding' : '0 2px',
            })
        else
            $(this).parent().siblings('p').css({
                'border' : 'none',
                'padding' : '0',
            })
        # if
    # click

    $('.zoom-side').on 'click', (e) ->
        e.preventDefault()
        $(this).closest('.product-img').toggleClass('zoom-box')
        srcImg = $(this).prop('src').split('/')
        srcLen = srcImg.length - 1
        if srcImg[srcLen] == 'zoomin.png'
            srcImg[srcLen] = 'zoomout.png'
            realSrc = srcImg.join('/')
            $(this).prop('src', realSrc)
        else
            srcImg[srcLen] = 'zoomin.png'
            realSrc = srcImg.join('/')
            $(this).prop('src', realSrc)
        # if
    # click

    $('.all-selct').on 'click', (e) ->
        e.preventDefault()
        $(this).find('input[type="radio"]').prop('checked', true)
    # click

    $('.start-rate label').on 'click', (e) ->
        e.preventDefault()
        $('.start-rate label').css({
            'color' : '#aaa',
        })
        prodRate = parseInt($(this).prop('id'))
        alert('Sucessfully rated with score: ' + prodRate)
        $(this).closest('input[type="radio"]').prop('checked', true)
        $(this).css({
            'color' : '#1C659C',
        })
        $(this).nextAll('label').css({
            'color' : '#1C659C',
        })
    # click

    # FIXME remove?
    $('#power1').on 'click', (e) ->
        e.preventDefault();
        drTop = $(this).offset().top
        drLeft = $(this).offset().left
        $('.powerPicker').prop('id', 'powerOne')
        $('.powerPicker').css({
            top : drTop - 256,
            left : drLeft - 153,
        }).slideToggle()
    # click
    $('#power2').on 'click', (e) ->
        e.preventDefault()
        drTop = $(this).offset().top
        drLeft = $(this).offset().left
        $('.powerPicker').prop('id', 'powerTwo')
        $('.powerPicker').css({
            top : drTop - 256,
            left : drLeft - 153,
        }).slideToggle()
    # click

    $('.powerPicker table td').on 'click', (e) ->
        e.preventDefault()
        pwr = $(this).text()
        chk = $('.powerPicker').prop('id')
        if chk == 'powerOne'
            $('#power1').val(pwr)
            $('.powerPicker').prop('id', '').slideUp()
        else
            $('#power2').val(pwr)
            $('.powerPicker').prop('id', '').slideUp()
        # if
    # click

    $('#box1').on 'click', (e) ->
        e.preventDefault()
        boTop = $(this).offset().top
        boLeft = $(this).offset().left
        $('.pbox').prop('id', 'boxOne')
        $('.pbox').css({
            top : boTop - 256,
            left : boLeft - 136,
        }).slideToggle()
    # click
    $('#box2').on 'click', (e) ->
        e.preventDefault()
        boTop = $(this).offset().top
        boLeft = $(this).offset().left
        $('.pbox').prop('id', 'boxTwo')
        $('.pbox').css({
            top : boTop - 256,
            left : boLeft - 136,
        }).slideToggle()
    # click

    $('.pbox table td').on 'click', (e) ->
        e.preventDefault()
        pwr = $(this).text()
        chk = $('.pbox').prop('id')
        if chk == 'boxOne'
            $('#box1').val(pwr)
            $('.pbox').prop('id', '').slideUp()
        else
            $('#box2').val(pwr)
            $('.pbox').prop('id', '').slideUp()
        # if
    # click
# jQuery
