<?php echo $header; ?>
<main>
<div class="container">
<div class="row">
	<div class="col s12 m12 l12">
		<div class="card">
			<div class="card-content">
				<span class="card-title"><?php echo $heading_title; ?></span>
				<p>
					<?php if ($products) { ?>
						<div class="collection">
							<a href="<?php echo $compare; ?>" id="compare-total" class="collection-item"> <?php echo $text_compare; ?></a>
						</div>
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
			<div class="card-action">
				<a href="<?php echo $continue; ?>"><?php echo $button_continue; ?></a>
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
<?php echo $footer; ?>
