<?php echo $header; ?>
<main>
<div class="container">
<div class="row">
	<?php if ($images) { ?>
		<div class="col s12 m12 l12">
			<div class="slider">
				<ul class="slides">
					<?php foreach ($images as $image) { ?>
						<li><img class="responsive-img" src="<?php echo $image['popup']; ?>" /></li>
					<?php } ?>
				</ul>
			</div>
		</div>
	<?php } ?>
	<div class="col s12 m12 l12">
		<div class="card white">
			<div class="card-content">
				<p>
					<span class="card-title"><?php echo $heading_title; ?></span>
					<table class="responsive-table">
						<tbody>
							<tr>
								<td class="left-align" style="vertical-align: center;">
									<p><img class="responsive-img" src="<?php echo $thumb; ?>" /></p>
								</td>
								<td class="left-align">
									<?php if ($manufacturer) { ?>
										<p><?php echo $text_manufacturer; ?>&nbsp;<a class="teal-text lighten-2" href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></p>
									<?php } ?>
									<?php if ($model) { ?>
										<p><?php echo $text_model; ?>&nbsp;<?php echo $model; ?></p>
									<?php } ?>
									<?php if ($reward) { ?>
										<p><?php echo $text_reward; ?>&nbsp;<?php echo $reward; ?></p>
									<?php } ?>
									<?php if ($stock) { ?>
										<p><?php echo $text_stock; ?>&nbsp;<?php echo $stock; ?></p>
									<?php } ?>
									<?php if ($price) { ?>
										<?php if (!$special) { ?>
											<p><?php echo $price; ?></p>
										<?php } else { ?>
											<p><?php echo $special; ?>&nbsp;<strike><?php echo $price; ?></strike></p>
										<?php } ?>
										<?php if ($tax) { ?>
											<p>(<?php echo $text_tax; ?>&nbsp;<?php echo $tax; ?>)</p>
										<?php } ?>
										<?php if ($points) { ?>
											<p><?php echo $text_points; ?>&nbsp;<?php echo $points; ?></p>
										<?php } ?>
										<?php if ($discounts) { ?>
											<?php foreach ($discounts as $discount) { ?>
												<p><?php echo $discount['quantity']; ?>&nbsp;<?php echo $text_discount; ?>&nbsp;<?php echo $discount['price']; ?></p>
											<?php } ?>
										<?php } ?>
									<?php } ?>
									<button type="button" class="btn btn-margin element-theme tooltipped" data-position="top" data-delay="50" data-tooltip="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="material-icons">favorite</i></button>
									<button type="button" class="btn btn-margin element-theme tooltipped" data-position="top" data-delay="50" data-tooltip="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="material-icons">thumbs_up_down</i></button>
								</td>
							</tr>
						</tbody>
					</table>
					<div id="product">
					<div class="input-field">
						<input type="text" name="quantity" id="input-quantity" value="<?php echo $minimum; ?>" size="2" />
						<label for="input-quantity"><?php echo $entry_qty; ?></label>
						<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
						<?php if ($minimum > 1) { ?>
							<script type="text/javascript">Materialize.toast('<span class="text-select-none"><?php echo $text_minimum; ?></span>', toastTime)</script>
						<?php } ?>
					</div>
					<p><button type="button" id="button-cart" class="btn btn-margin element-theme"><?php echo $button_cart; ?></button></p>
					</div>
					<span class="card-title"><?php echo $tab_description; ?></span>
					<p><?php echo $description; ?></p>
					<?php if ($attribute_groups) { ?>
						<span class="card-title"><?php echo $tab_attribute; ?></span>
						<table class="responsive-table">
							<?php foreach ($attribute_groups as $attribute_group) { ?>
								<thead>
									<tr>
										<td><span class="card-title"><small><?php echo $attribute_group['name']; ?></small></span></td>
									</tr>
								</thead>
								<tbody>
									<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
										<tr>
											<td><?php echo $attribute['name']; ?></td>
											<td><?php echo $attribute['text']; ?></td>
										</tr>
									<?php } ?>
								</tbody>
							<?php } ?>
						</table>
					<?php } ?>
				</p>
			</div>
			<!--action-->
		</div>
	</div>
	<?php if ($review_status) { ?>
		<div class="col s12 m12 l12">
			<div class="card white">
				<div class="card-content">
					<span class="card-title"><?php echo $text_write; ?></span>
					<form id="form-review">
						<?php if ($review_guest) { ?>
							<div class="collection see-reviews">
								<a class="collection-item clickable modal-trigger" href="#modal-reviews"><?php echo $tab_review; ?></a>
							</div>
							<div class="input-field required">
								<input type="text" name="name" id="input-name" value="" />
								<label for="input-name"><?php echo $entry_name; ?></label>
							</div>
							<div class="input-field required">
								<textarea class="materialize-textarea" name="text" id="input-review" rows="5"></textarea>
								<label for="input-review"><?php echo $entry_review; ?></label>
							</div>
							<p><?php echo $entry_rating; ?></p>
							<div class="input-field text-select-none wrap-none">
								<div class="set-rating">
									<i class="material-icons clickable" id="rating-one" value="1">star_border</i>
									<i class="material-icons clickable" id="rating-two" value="2">star_border</i>
									<i class="material-icons clickable" id="rating-three" value="3">star_border</i>
									<i class="material-icons clickable" id="rating-four" value="4">star_border</i>
									<i class="material-icons clickable" id="rating-five" value="5">star_border</i>
								</div>
								<input type="hidden" name="rating" id="input-rating" value="" />
							</div>
							<div class="input-field required">
								<input type="text" name="captcha" value="" id="input-captcha" class="form-control" />
								<label for="input-captcha"><?php echo $entry_captcha; ?></label>
							</div>
							<div class="input-field">
								<img src="index.php?route=tool/captcha" alt="" id="captcha" />
							</div>
							<?php if ($tags) { ?>
								<p><?php echo $text_tags; ?></p>
								<?php for ($i = 0; $i < count($tags); $i++) { ?>
									<?php if ($i < (count($tags) - 1)) { ?>
										<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
									<?php } else { ?>
										<a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
									<?php } ?>
								<?php } ?>
							<?php } ?>	
						<?php } else { ?>
							<p><span class="text-select-none"><?php echo $text_login; ?></span></p>
						<?php } ?>
					</form>
				</div>
				<?php if ($review_guest) { ?>
					<div class="card-action">
						<a class="clickable" id="button-review"><?php echo $button_continue; ?></a>
					</div>
				<?php } ?>
			</div>
		</div>
	<?php } ?>
	
	<?php if ($products) { ?>
		<p><h5 class="centered"5><?php echo $text_related; ?></h5></p>
			<?php foreach ($products as $product) { ?>
				<div class="col s12 m6 l3">
		<div class="card">
			<div class="card-image waves-effect waves-block waves-light">
				<img class="activator" src="<?php echo $product['thumb']; ?>">
			</div>
			<div class="card-content">
				<span class="card-title">
					<a class="teal-text lighten-2" href="<?php echo $product['href']; ?>"><small class="text-size"><span class="cut-long-string"><?php echo $product['name']; ?></span></small></a>
				</span>
				<p>
					<p><span class="wrap-none">
					 <?php if ($product['price']) { ?>
						<?php if (!$product['special']) { ?>
							<span class="wrap-none"><b><?php echo $product['price']; ?></b></span>
						<?php } else { ?>
							<span class="wrap-none"><b><?php echo $product['special']; ?></b>&nbsp;<strike><?php echo $product['price']; ?></strike></span>
						<?php } ?>
					<?php } ?>
					</span></p>
					<script type="text/javascript">showRating(<?php echo $product['rating']; ?>);</script>

				</p>
			</div>
			<div class="card-action wrap-none">
				<a class="clickable" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="material-icons">shopping_cart</i></a>
				<a class="clickable" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="material-icons">favorite</i></a>
				<a class="clickable" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="material-icons">thumbs_up_down</i></a>
			</div>
			<div class="card-reveal">
				<span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i></span>
				<span class="card-title"><a href="<?php echo $product['href']; ?>" class="teal-text lighten-2"><small><?php echo $product['name']; ?></small></a></span>
				<p><?php echo $product['description']; ?></p>
				<p>
					<?php if ($product['price']) { ?>
						<?php if (!$product['special']) { ?>
							<span><?php echo $product['price']; ?></span>
						<?php } else { ?>
							<span><?php echo $product['special']; ?></span>&nbsp;<strike><?php echo $product['price']; ?></strike>
						<?php } ?>
						<?php if ($product['tax']) { ?>
							<p>(<span><?php echo $text_tax; ?>&nbsp;<?php echo $product['tax']; ?></span>)</p>
						<?php } ?>
					<?php } ?>
				</p>
			</div>
		</div>
	</div>
		<?php } ?>
	<?php } ?>
	
</div>
</div>
<div id="modal-reviews" class="modal modal-fixed-footer">
	<div class="modal-content">
		<h5><?php echo $tab_review; ?></h5>
		<p>
			<div id="show-reviews"></div>
		</p>
	</div>
	<div class="modal-footer">
		<a class="modal-action modal-close btn-flat clickable">OK</a>
	</div>
</div>
</main>
<script type="text/javascript"><!--
$(document).ready(function(){
	$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
		$.ajax({
			url: 'index.php?route=product/product/getRecurringDescription',
			type: 'post',
			data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
			dataType: 'json',
			beforeSend: function(){
				$('#nav-preloader').show();
			},
			complete: function(){
				$('#nav-preloader').hide();
			},
			success: function(json) {
				if (json['success']) {
					Materialize.toast('<span class="text-select-none">' + json['success'] + '</span>', toastTime);
				}
			}
		});
	});
});
//--></script>
<script type="text/javascript"><!--
$(document).ready(function(){
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},
		success: function(json) {
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i>' + json['error']['option'][i] + '</span>', toastTime);
					}
				}
				if (json['error']['recurring']) {
					Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i>' + json['error']['recurring'] + '</span>', toastTime);
				}
			}

			if (json['success']) {
				Materialize.toast('<span class="text-select-none"><i class="left material-icons">done_all</i>' + json['success'] + '</span>', toastTime);

				$('#cart-total-nav').html(json['total']);
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            Materialize.toast('<span class="text-select-none">' + thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText + '</span>', toastTime);
        }
	});
});
});
//--></script>
<script type="text/javascript"><!--
$(document).ready(function(){
	$('#show-reviews').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
});

$(document).ready(function(){
$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},
		success: function(json) {
			if (json['error']) {
				Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i>' + json['error'] + '</span>', toastTime);
			}

			if (json['success']) {
				Materialize.toast('<span class="text-select-none"><i class="left material-icons">done_all</i>' + json['success'] + '</span>', toastTime);
				
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
				$('input[name=\'captcha\']').val('');
			}
		},
		complete: function() {
			$('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
		},
	});
});
});

$(document).ready(function(){
	$('.set-rating').find('.material-icons').on('click', function(){
		if($(this).attr('value') == 1){
			$('.set-rating').hide();
			$('#rating-one').html('star');
			$('#rating-two').html('star_border');
			$('#rating-three').html('star_border');
			$('#rating-four').html('star_border');
			$('#rating-five').html('star_border');
			$('.set-rating').show();
			$('#input-rating').attr('value', 1);
		}
		if($(this).attr('value') == 2){
			$('.set-rating').hide();
			$('#rating-one').html('star');
			$('#rating-two').html('star');
			$('#rating-three').html('star_border');
			$('#rating-four').html('star_border');
			$('#rating-five').html('star_border');
			$('.set-rating').show();
			$('#input-rating').attr('value', 2);
		}
		if($(this).attr('value') == 3){
			$('.set-rating').hide();
			$('#rating-one').html('star');
			$('#rating-two').html('star');
			$('#rating-three').html('star');
			$('#rating-four').html('star_border');
			$('#rating-five').html('star_border');
			$('.set-rating').show();
			$('#input-rating').attr('value', 3);
		}
		if($(this).attr('value') == 4){
			$('.set-rating').hide();
			$('#rating-one').html('star');
			$('#rating-two').html('star');
			$('#rating-three').html('star');
			$('#rating-four').html('star');
			$('#rating-five').html('star_border');
			$('.set-rating').show();
			$('#input-rating').attr('value', 4);
		}
		if($(this).attr('value') == 5){
			$('.set-rating').hide();
			$('#rating-one').html('star');
			$('#rating-two').html('star');
			$('#rating-three').html('star');
			$('#rating-four').html('star');
			$('#rating-five').html('star');
			$('.set-rating').show();
			$('#input-rating').attr('value', 5);
		}
		
	});
});

//--></script>
<?php echo $footer; ?>