<h4 class="center"><?php echo $heading_title; ?></h4>
<div class="row">
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
</div>