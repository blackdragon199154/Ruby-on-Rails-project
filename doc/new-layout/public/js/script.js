$(function(){
	$("#countries").msDropdown();
	$("#countries-flag").msDropdown();
	$('.zoomin').on('click', function(e){
		e.preventDefault();
		$(this).closest('.details-img').toggleClass('zoom-box');
		var srcImg = $(this).prop('src').split('/');
		var srcLen = srcImg.length - 1;
		if(srcImg[srcLen] == 'zoomin.png'){
			srcImg[srcLen] = 'zoomout.png';
			var realSrc = srcImg.join('/');
			$(this).prop('src', realSrc);
		} else {
			srcImg[srcLen] = 'zoomin.png';
			var realSrc = srcImg.join('/');
			$(this).prop('src', realSrc);
		}
	});
	$('.color-w').on('click', function(e){
		e.preventDefault();
		$(this).siblings().removeClass('zoom-box')
		$(this).toggleClass('zoom-box');
	});
	$('.accord-head a').on('click', function(){
		var chk = $(this).children('span').text();
		if(chk == 'open'){
			$(this).children('span').empty().text('close');
		} else {
			$(this).children('span').empty().text('open');
		}
	});
	
	$('.quick_search').on('click','input[type=checkbox]',function () {
		if($(this).is(':checked')){
			$(this).parent().siblings('p').css({
				'border' : '1px dotted #ccc',
				'padding' : '0 2px'
			});
		} else {
			$(this).parent().siblings('p').css({
				'border' : 'none',
				'padding' : '0'
			});
		}
	});
	$('.zoom-side').on('click', function(e){
		e.preventDefault();
		$(this).closest('.product-img').toggleClass('zoom-box');
		var srcImg = $(this).prop('src').split('/');
		var srcLen = srcImg.length - 1;
		if(srcImg[srcLen] == 'zoomin.png'){
			srcImg[srcLen] = 'zoomout.png';
			var realSrc = srcImg.join('/');
			$(this).prop('src', realSrc);
		} else {
			srcImg[srcLen] = 'zoomin.png';
			var realSrc = srcImg.join('/');
			$(this).prop('src', realSrc);
		}
	});
	$('.all-selct').on('click', function(e){
		e.preventDefault();	
		$(this).find('input[type="radio"]').prop('checked', true);
	});
	$('.cart .nof-item').hover(function(e){
		e.preventDefault();
		e.stopPropagation();
		var that = $(this);
		var brwLeft = that.offset().left,
			brwTop = that.offset().top;
		that.append('<div class="item-popup popover fade bottom in">\
						<div class="arrow"></div>\
						<p>There is <strong>1 item</strong> in your cart</p>\
						<p class="crt-ttl">Cart Subtotal : <strong>$11.99</strong></p>\
						<button type="button" style="padding:4px 18px !important;" class="btn btn-primary chk-out pull-right">Checkout</button>\
						<div class="vsap2"></div>\
						<a href="#" class="wish-list pull-right" style="color:#fff;">save to wish list</a>\
						<div class="bdrb" style="clear:both;"></div>\
						<div class="vsap2"></div>\
						<h6 style="font-weight:bold;">Recently added item(s)</h6>\
						<div class="vsap2"></div>\
						<div class="rec-item">\
							<div class="prd-pnl">\
								<img src="public/img/handle.png" height="52">\
							</div>\
							<div class="prd-desc">\
								<p>\
									<span><img src="public/img/crx.png" height="16"></span>\
									<span><img src="public/img/edit.png" height="16"></span>\
								</p>\
								<p>NFL Field Tug Toy</p>\
								<p style="font-size:10px;">1 x $11.99</p>\
							</div>\
						</div>\
					</div>');
		$('.item-popup').css({
			top: brwTop-22,
			display : 'block'
		});
	}, function(e){
		e.preventDefault();
		$('.item-popup').remove();
	});
	$('.start-rate label').on('click', function(e){
		e.preventDefault();
		$('.start-rate label').css({
			'color' : '#aaa'
		});
		var prodRate = parseInt($(this).prop('id'));
		alert('Sucessfully rated with score: ' + prodRate);
		$(this).closest('input[type="radio"]').prop('checked', true);
		$(this).css({
			'color' : '#1C659C'
		});
		$(this).nextAll('label').css({
			'color' : '#1C659C'
		});
	});
	$('#power1').on('click', function(e){
		e.preventDefault();
		$('.powerPicker1').prop('id', 'powerOne');
		$('.powerPicker1').slideToggle();
	});
	$('#power2').on('click', function(e){
		e.preventDefault();
		$('.powerPicker2').prop('id', 'powerTwo');
		$('.powerPicker2').slideToggle();
	});
	$('.powerPicker1 table td').on('click', function(e){
		e.preventDefault();
		var pwr = $(this).text();
		var chk = $('.powerPicker1').prop('id');
		if(chk == 'powerOne'){
			$('#power1').val(pwr);
			$('.powerPicker1').prop('id', '').slideUp();
		} else {
			$('#power2').val(pwr);
			$('.powerPicker1').prop('id', '').slideUp();
		}
	});
	$('.powerPicker2 table td').on('click', function(e){
		e.preventDefault();
		var pwr = $(this).text();
		var chk = $('.powerPicker2').prop('id');
		if(chk == 'powerOne'){
			$('#power1').val(pwr);
			$('.powerPicker2').prop('id', '').slideUp();
		} else {
			$('#power2').val(pwr);
			$('.powerPicker2').prop('id', '').slideUp();
		}
	});
	
	$('#box1').on('click', function(e){
		e.preventDefault();
		$('.pbox1').prop('id', 'boxOne');
		$('.pbox1').slideToggle();
	});
	$('#box2').on('click', function(e){
		e.preventDefault();
		$('.pbox2').prop('id', 'boxTwo');
		$('.pbox2').slideToggle();
	});
	$('.pbox1 table td').on('click', function(e){
		e.preventDefault();
		var pwr = $(this).text();
		var chk = $('.pbox1').prop('id');
		if(chk == 'boxOne'){
			$('#box1').val(pwr);
			$('.pbox1').prop('id', '').slideUp();
		} else {
			$('#box2').val(pwr);
			$('.pbox1').prop('id', '').slideUp();
		}
	});
	$('.pbox2 table td').on('click', function(e){
		e.preventDefault();
		var pwr = $(this).text();
		var chk = $('.pbox2').prop('id');
		if(chk == 'boxOne'){
			$('#box1').val(pwr);
			$('.pbox2').prop('id', '').slideUp();
		} else {
			$('#box2').val(pwr);
			$('.pbox2').prop('id', '').slideUp();
		}
	});
	
	$('.single-view img').on('click', function(e){
		e.preventDefault();
		var imgSrc = $(this).prop('src');
		$('.change-img').prop('src', imgSrc);
	});
	$('.read-all').on('click', function(e){
		e.preventDefault();
		$('.review-panel').slideToggle();
	});
	$('.sqr-one').on('click', function(e){
		e.preventDefault();
		if($(this).find('.squaredOne input[type="checkbox"]').is(':Checked')){
			$(this).find('.squaredOne input[type="checkbox"]').prop('checked', false);
		} else {
			$(this).find('.squaredOne input[type="checkbox"]').prop('checked', true);
		}
	});
	
	$('.rev-all').on('click', function(e){
		e.preventDefault();
		$('.review-all').fadeIn();
	});
	$('.cross-pop').on('click', function(e){
		e.preventDefault();
		$('.review-all').fadeOut();
	});
});