<?php echo $header; ?>
<main>
<div class="container">
<div class="row">
	<div class="col s12 m12 l12">
		<div class="card white">
			<div class="card-content">
				<span class="card-title"><?php echo $heading_title; ?></span>
				<p>
					<span class="card-title"><small><?php echo $entry_search; ?></small></span>
					<div class="input-field">
						<input type="text" name="search" id="input-search-page" value="<?php echo $search; ?>" />
						<label for="search"><?php echo $text_keyword; ?></label>
					</div>
					<div class="input-field">
						<select name="category_id" id="category_id">
							<option value="0"><?php echo $text_category; ?></option>
							<?php foreach ($categories as $category_1) { ?>
								<?php if ($category_1['category_id'] == $category_id) { ?>
									<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
								<?php } else { ?>
									<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
								<?php } ?>
								<?php foreach ($category_1['children'] as $category_2) { ?>
									<?php if ($category_2['category_id'] == $category_id) { ?>
										<option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
									<?php } ?>
									<?php foreach ($category_2['children'] as $category_3) { ?>
										<?php if ($category_3['category_id'] == $category_id) { ?>
											<option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
										<?php } else { ?>
											<option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
										<?php } ?>
									<?php } ?>
								<?php } ?>
							<?php } ?>
						</select>
					</div>
					<div class="input-field">
						<?php if ($sub_category) { ?>
							<input type="checkbox" id="sub_category" name="sub_category" value="1" checked="checked" />
							<label for="sub_category"><?php echo $text_sub_category; ?></label>
						<?php } else { ?>
							<input type="checkbox" id="sub_category" name="sub_category" value="1" />
							<label for="sub_category"><?php echo $text_sub_category; ?></label>
						<?php } ?>
					</div>
					<div class="input-field">
						<?php if ($description) { ?>
							<input type="checkbox" id="description" name="description" value="1" checked="checked" />
							<label for="description"><?php echo $entry_description; ?></label>
						<?php } else { ?>
							<input type="checkbox" id="description" name="description" value="1" />
							<label for="description"><?php echo $entry_description; ?></label>
						<?php } ?>
					</div>
				</p>
			</div>
			<div class="card-action">
				<a class="button-search-page clickable"><?php echo $button_search; ?></a>
			</div>
		</div>
	</div>
	<div class="col s12 m12 l12">
		<div class="card white">
			<div class="card-content">
				<span class="card-title"><?php echo $text_search; ?></span>
				<p>
					<div class="collection">
						<a class="collection-item" href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a>
					</div>
					<?php if ($products) { ?>
						<div class="input-field">
							<select id="input-sort" onchange="location = this.value;">
								<?php foreach ($sorts as $sorts) { ?>
									<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
										<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
							<label><?php echo $text_sort; ?></label>
						</div>
						<div class="input-field">
							<select id="input-limit" onchange="location = this.value;">
								<?php foreach ($limits as $limits) { ?>
									<?php if ($limits['value'] == $limit) { ?>
										<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
									<?php } else { ?>
										<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
									<?php } ?>
								<?php } ?>
							</select>
							<label><?php echo $text_limit; ?></label>
						</div>
					<?php } else { ?>
						<p><?php echo $text_empty; ?></p>
					<?php } ?>
				</p>
			</div>
		</div>
	</div>
	<?php if ($products) { ?>
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
		<div class="col s12 m12 l12 centered"><?php echo $results; ?></div>
		<div class="col s12 m12 l12 centered"><?php echo $pagination; ?></div>
	<?php } ?>
</div>
</div>
</main>

<script type="text/javascript"><!--
$(document).ready(function(){
	$('.button-search-page').on('click', function(){
		url = 'index.php?route=product/search';
		var search = $('#input-search-page').prop('value');
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}
		var category_id = $('#category_id').prop('value');
		if (category_id > 0) {
			url += '&category_id=' + encodeURIComponent(category_id);
		}
		var sub_category = $('#sub_category:checked').prop('value');
		if (sub_category) {
			url += '&sub_category=true';
		}
		var filter_description = $('#description:checked').prop('value');
		if (filter_description) {
			url += '&description=true';
		}
		location = url;
	});
});
$(document).ready(function(){
	$('#input-search-page').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('.button-search-page').trigger('click');
		}
	});
});
$(document).ready(function(){
	$('#category_id').on('change', function() {
		if (this.value == '0') {
			$('#sub_category').prop('disabled', true);
		} else {
			$('#sub_category').prop('disabled', false);
		}
	});
});
$(document).ready(function(){
	$('#category_id').trigger('change');
});
--></script>
<?php echo $footer; ?>
