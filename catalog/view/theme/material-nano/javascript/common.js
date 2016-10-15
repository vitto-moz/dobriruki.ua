/* =========== activate material functions =========== */
$(document).ready(function(){
	$('.collapsible').collapsible({
		accordion : false
	});
	$('.carousel').carousel();
	$('.slider').slider({
		full_width: true
	});
	$("#slide-out-left-button").sideNav({
		menuWidth: 300,
		edge: 'left'
	});
	$(".dropdown-button").dropdown({
		belowOrigin: false
	});
	$('select').material_select();
	$('.parallax').parallax();
	$('.materialboxed').materialbox();
	$('.modal-trigger').leanModal();
	$('.submit-link').on('click', function(){
		$('form').submit();
	});
	$('.chips').material_chip();
	$('.tooltipped').tooltip({delay: 50});
});

/* ========== time set for toast ============ */
var toastTime = 25000;

/* =========== input-field required ==================== */
$(document).ready(function(){
	$('.input-field').each(function(){
		if($(this).hasClass('required')){
			$(this).find('label').prepend('<span style="color: red;">* </span>');
		}
	});
});

/* =========== responsive =========== */
function toHex(str){
	var result = "";
	for (var i=0; i<str.length; i++){
		result += str.charCodeAt(i).toString(16);
		}
	return result;
	}
$(document).ready(function(){
	$('.dropdown-category').each(function(){
		dataAttr = $(this).find('.dropdown-button-category').attr('title');
		dataActivates = toHex(dataAttr);
		$(this).find('.dropdown-button-category').attr('data-activates', dataActivates);
		$(this).find('.dropdown-content-category').attr('id', dataActivates);
	});
	$('.dropdown-button-category').dropdown({
		constrain_width: true
	});
});
$(document).ready(function(){
	if($(window).width() <= 540){
		$('#cart-name').hide();
	}
	$(window).resize(function(){
		if($(window).width() > 540){
			$('#cart-name').show();
			}
			 if($(window).width() <= 540){
			$('#cart-name').hide();
			}
		});
	if($(window).width() > 992){
		$('#category-menu-desktop').show();
	}
	if($(window).width() <= 992){
		$('#category-menu-mobile').show();
	}
	$(window).resize(function(){
		if($(window).width() > 992){
			$('#category-menu-desktop').show();
			$('#category-menu-mobile').hide();
		}
		if($(window).width() <= 992){
			$('#category-menu-mobile').show();
			$('#category-menu-desktop').hide();
		}
	});
});

/* =========== cutting long strings =========== */
function cutLongString(element, count_lit, light){
	var text = element.html();
	var all_len = text.length;
	var new_text;
	if (all_len > count_lit){
		new_text = text.substr(0, (count_lit - 3)) + ' ...';
		if(light){
			var first_part_text = new_text.substr(0, (count_lit - 10));
			var light_part_text = new_text.substr((count_lit - 10), count_lit);
			var light_text = "";
			var array_color = ["#444444", "#545454", "#646464", "#747474", "#848484", "#949494", "#a4a4a4", "#b4b4b4", "#c4c4c4", "#d4d4d4"];
			for(var i = 0; i < 10; i ++){
				light_text += "<span style='color: " + array_color[i] + "'>" + light_part_text.substr(i, 1) + "</span>";
			}
			new_text = first_part_text + light_text;
		}
		element.html(new_text);
	}
}
$(document).ready(function(){
	$('.cut-long-string').each(function(){
		cutLongString($(this), 14, false);
	});
	$('.nav-store-name').each(function(){
		cutLongString($(this), 20, false);
	});
	$('.nav-store-phone').each(function(){
		cutLongString($(this), 20, false);
	});
});

/* =========== show product ratings ============ */

function showRating(ProductRating){
	if(ProductRating == ''){
		document.write('<p><span class="wrap-none text-select-none"><i class="material-icons">star_border</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i></span></p>');
	} else {
		switch (ProductRating){
			case 0:
				document.write('<p><span class="wrap-none text-select-none"><i class="material-icons">star_border</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i></span></p>');
				break;
			case 1:
				document.write('<p><span class="wrap-none text-select-none"><i class="material-icons">star</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i></span></p>');
				break;
			case 2:
				document.write('<p><span class="wrap-none text-select-none"><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i></span></p>');
				break;
			case 3:
				document.write('<p><span class="wrap-none text-select-none"><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i></span></p>');
				break;
			case 4:
				document.write('<p><span class="wrap-none text-select-none"><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star_border</i></span></p>');
				break;
			case 5:
				document.write('<p><span class="wrap-none text-select-none"><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i></span></p>');
				break;
		}
	}
}

/* =========== search nav =========== */
$(document).ready(function(){
	$('.search-category-button').on('click', function(){
		$('.collapsible-body').remove();
		location = $('base').attr('href') + 'index.php?route=product/search';
	});
});
$(document).ready(function(){
	$('.search-nav-close').on('click', function(){
		$('.search-nav').hide();
	});
	$('.search-nav-button').on('click', function(){
		$('.search-nav').show();
		$('.input-search').trigger('focus');
	});
	$('.search-nav').find('.to-search-button').on('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
		var value = $('.input-search').val();
		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}
		location = url;
	});
	$('.search-nav').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('.to-search-button').trigger('click');
		}
	});
});

/* =========== currency and languge =========== */
$(document).ready(function(){
	$('#currency .currency-select').on('click', function(e) {
		e.preventDefault();
		$('#currency input[name=\'code\']').attr('value', $(this).attr('href'));
		$('#currency').submit();
	});
	$('#language .language-select').on('click', function(e) {
		e.preventDefault();
		$('#language input[name=\'code\']').attr('value', $(this).attr('href'));
		$('#language').submit();
	});
});

/* ============ checkout click trigger ============ */
$(document).ready(function(){
	$(document).on('keydown', '#checkout-option input[name=\'email\'], #checkout-option input[name=\'password\']', function(e) {
		if (e.keyCode == 13) {
			$('#checkout-option #button-login').trigger('click');
		}
	});
});

/* ============ Cart add remove functions ============ */
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function(){
				$('#nav-preloader').show();
			},
			complete: function(){
				$('#nav-preloader').hide();
			},
			success: function(json) {
				if (json['redirect']) {
					location = json['redirect'];
				}
				if (json['success']) {
					Materialize.toast('<span class="text-select-none"><i class="left material-icons">shopping_cart</i>' + json['success'] + '</span>', toastTime);
					$('#cart-total-nav').html(json['total']);
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				Materialize.toast('<span class="text-select-none"><i class="left material-icons">error</i>' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
			}
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function(){
				$('#nav-preloader').show();
			},
			complete: function(){
				$('#nav-preloader').hide();
			},
			success: function(json) {
				$('#cart-total-nav').html(json['total']);
				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				Materialize.toast('<span class="text-select-none"><i class="left material-icons">error</i>' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
			}
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function(){
				$('#nav-preloader').show();
			},
			complete: function(){
				$('#nav-preloader').hide();
			},
			success: function(json) {
				$('#cart-total-nav').html(json['total']);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				Materialize.toast('<span class="text-select-none"><i class="left material-icons">error</i>' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
			}
		});
	}
}

var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function(){
				$('#nav-preloader').show();
			},
			complete: function(){
				$('#nav-preloader').hide();
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				$('#cart-total-nav').html(json['total']);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            Materialize.toast('<span class="text-select-none"><i class="left material-icons">error</i>' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
	        }
		});
	}
}

var wishlist = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			beforeSend: function(){
				$('#nav-preloader').show();
			},
			complete: function(){
				$('#nav-preloader').hide();
			},
			success: function(json) {
				if (json['redirect']) {
					location = json['redirect'];
				}
				if (json['success']) {
					Materialize.toast('<span class="text-select-none"><i class="left material-icons">favorite</i>' + json['success'] + '</span>', toastTime);
				}
				$('#wishlist-total-menu').html(json['total']);
				$('#wishlist-total-nav').html(json['total']);
			},
			error: function(xhr, ajaxOptions, thrownError) {
				Materialize.toast('<span class="text-select-none"><i class="left material-icons">error</i>' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
			}
		});
	},
	'remove': function() {
	}
}

var compare = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			beforeSend: function(){
				$('#nav-preloader').show();
			},
			complete: function(){
				$('#nav-preloader').hide();
			},
			success: function(json) {
				if (json['success']) {
					Materialize.toast('<span class="text-select-none"><i class="left material-icons">thumbs_up_down</i>' + json['success'] + '</span>', toastTime);
					$('#compare-total').html(json['total']);
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				Materialize.toast('<span class="text-select-none"><i class="left material-icons">error</i>' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
			}
		});
	},
	'remove': function() {
	}
}

/* ========== Agree to Terms ============= */
$(document).ready(function(){
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();

	$('#modal-agree').remove();

	var element = this;

	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal">';
			html += '	<div class="modal-content">';
			html += '		<h5>' + $(element).text() + '</h5>';
			html += '		<p>' + data + '</p>';
			html += '	</div';
			html += '  	<div class="modal-footer">';
			html += '		<a class="modal-action modal-close btn-flat right clickable">OK</a>';
			html += '	</div>';
			html += '</div>';

			$('main').append(html);

			$('#modal-agree').openModal();
		}
	});
});
});