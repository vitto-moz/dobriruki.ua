<?php echo $header; ?>
<main>
<div class="container">
<?php if ($success) { ?>
	<script type="text/javascript">
		Materialize.toast('<span class="text-select-none"><i class="left material-icons">done_all</i><?php echo $success; ?></span>', toastTime);
	</script>
<?php } ?>
<div class="row">
		<div class="col s12 m12 l12">
			<div class="card white">
				<div class="card-content">
					<span class="card-title"><?php echo $heading_title; ?></span>
					<p>
						<?php if ($products) { ?>
						<table class="responsive-table">
							<tbody>
								<?php foreach ($products as $product) { ?>
								<tr>
									<td class="left-align">
										<?php if ($product['thumb']) { ?>
											<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
										<?php } ?>
									</td>
									<td class="left-align">
										<p><a class="teal-text lighten-2" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></p>
										<p><?php echo $column_model; ?>: <?php echo $product['model']; ?></p>
									</td>
									<td class="left-align"><?php echo $column_stock; ?>: <?php echo $product['stock']; ?></td>
									<td class="left-align">
										<p>
										<?php if ($product['price']) { ?>
											<?php if (!$product['special']) { ?>
												<b><?php echo $product['price']; ?></b>
											<?php } else { ?>
												<b><?php echo $product['special']; ?></b> <s><?php echo $product['price']; ?></s>
											<?php } ?>
										<?php } ?>
										</p>
									</td>
									<td class="right-align">
										<a class="btn btn-margin element-theme tooltipped" onclick="cart.add('<?php echo $product['product_id']; ?>');" data-position="top" data-delay="50" data-tooltip="<?php echo $button_cart; ?>"><i class="material-icons">shopping_cart</i></a></p>
										<a class="btn btn-margin element-theme tooltipped" href="<?php echo $product['remove']; ?>" data-position="top" data-delay="50" data-tooltip="<?php echo $button_remove; ?>"><i class="material-icons">delete</i></a></p>
									</td>
          			</tr>
								<?php } ?>
        			</tbody>
      			</table>
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
	</div>
</div>
</main>
<?php echo $footer; ?>
