<?php echo $header; ?>
<main>
<div class="container">
	<?php if ($attention) { ?>
		<script type="text/javascript">
			Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $attention; ?></span>', toastTime);
		</script>
	<?php } ?>
	<?php if ($success) { ?>
		<script type="text/javascript">
			Materialize.toast('<span class="text-select-none"><i class="left material-icons">done_all</i><?php echo $success; ?></span>', toastTime);
		</script>
	<?php } ?>
	<?php if ($error_warning) { ?>
		<script type="text/javascript">
			Materialize.toast('<span class="text-select-none"><i class="left material-icons">error</i><?php echo $error_warning; ?></span>', toastTime);
		</script>
	<?php } ?>
	<div class="row">
		<div class="col s12 m12 l12">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<div class="card white">
				<div class="card-content">
					<span class="card-title">
						<?php echo $heading_title; ?>
						<?php if ($weight) { ?>
							&nbsp;(<?php echo $weight; ?>)
						<?php } ?>
					</span>
					<p>
						<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
						<table class="responsive-table">
							<tbody>
								<?php foreach ($products as $product) { ?>
								<tr>
									<td class="centered">
										<?php if ($product['thumb']) { ?>
											<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" /></a>
										<?php } ?>
									</td>
									<td class="centered">
										<a class="teal-text lighten-2" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a><br />
										<?php echo $column_model; ?>: <?php echo $product['model']; ?><br />
										<?php if ($product['reward']) { ?>
											<small><?php echo $product['reward']; ?></small><br />
										<?php } ?>
										<?php if ($product['option']) { ?>
											<?php foreach ($product['option'] as $option) { ?>
												<small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
											<?php } ?>
										<?php } ?>
										<?php if ($product['recurring']) { ?>
											<small><?php echo $text_recurring_item; ?> <?php echo $product['recurring']; ?></small><br />
										<?php } ?>
										<?php if (!$product['stock']) { ?>
											***
										<?php } ?>
									</td>
									<td class="centered">
										<div class="input-field">
											<input type="text" name="quantity[<?php echo $product['key']; ?>]" id="input-quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1">
											<label for="input-quantity[<?php echo $product['key']; ?>]"><?php echo $column_quantity; ?></label>
										</div>
										<button type="submit" class="btn btn-margin element-theme tooltipped" data-position="top" data-delay="50" data-tooltip="<?php echo $button_update; ?>"><i class="material-icons">refresh</i></button>
										<button class="btn btn-margin element-theme tooltipped" data-position="top" data-delay="50" data-tooltip="<?php echo $button_remove; ?>" onclick="cart.remove('<?php echo $product['key']; ?>');"><i class="material-icons">delete</i></button>
									</td>
									<td class="centered">
										<?php echo $column_price; ?>:<br />
										<?php echo $product['price']; ?>
									</td>
									<td class="centered">
										<?php echo $column_total; ?>:<br />
										<?php echo $product['total']; ?>
									</td>
								</tr>
								<?php } ?>
							</tbody>
						</table>
						</form>
					</p>
					<p>
						<table class="responsive-table">
							<?php foreach ($totals as $total) { ?>
							<tr>
								<td class="left-align"><b><?php echo $total['title']; ?>:</b></td>
								<td class="left-align"><?php echo $total['text']; ?></td>
							</tr>
							<?php } ?>
						</table>
					</p>
				</div>
				<div class="card-action">
					<a href="<?php echo $continue; ?>"><?php echo $button_shopping; ?></a>
					<a href="<?php echo $checkout; ?>"><?php echo $button_checkout; ?></a>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
</main>
<?php echo $footer; ?>
