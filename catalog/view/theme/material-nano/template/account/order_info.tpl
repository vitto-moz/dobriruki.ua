<?php echo $header; ?>
<main>
<div class="container">
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
				<span class="card-title"><?php echo $heading_title; ?></span>
				<p>
					<span class="card-title"><small><?php echo $text_order_detail; ?></small></span>
					<p>
						<table class="responsive-table">
							<tbody>
								<tr>
									<td class="left-align" style="width: 50%;">
										<?php if ($invoice_no) { ?>
											<p><b><?php echo $text_invoice_no; ?></b> <?php echo $invoice_no; ?></p>
										<?php } ?>
										<p><b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?></p>
										<p><b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></p>
									</td>
									<td class="left-align">
										<?php if ($payment_method) { ?>
											<p><b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?></p>
										<?php } ?>
										<?php if ($shipping_method) { ?>
											<p><b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?></p>
										<?php } ?>
									</td>
								</tr>
							</tbody>
						</table>
					</p>
					<p>
						<table class="responsive-table">
							<tbody>
								<tr>
									<td class="left-align">
										<p><b><?php echo $text_payment_address; ?>:</b></p>
										<p><?php echo $payment_address; ?></p>
									</td>
									<?php if ($shipping_address) { ?>
										<td class="left-align">
											<p><b><?php echo $text_shipping_address; ?>:</b></p>
											<p><?php echo $shipping_address; ?></p>
										</td>
									<?php } ?>
								</tr>
							</tbody>
						</table>
					</p>
					<p>
						<table class="responsive-table">
							<tbody>
								<?php foreach ($products as $product) { ?>
									<tr>
										<td class="left-align">
											<p><b><?php echo $column_name; ?>:</b></p>
											<p><?php echo $product['name']; ?></p>
											<?php foreach ($product['option'] as $option) { ?>
												<p><small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small></p>
											<?php } ?>
										</td>
										<td class="left-align">
											<p><b><?php echo $column_model; ?>:</b></p>
											<p><?php echo $product['model']; ?></p>
										</td>
										<td class="left-align">
											<p><b><?php echo $column_quantity; ?>:</b></p>
											<p><?php echo $product['quantity']; ?></p>
										</td>
										<td class="left-align">
											<p><b><?php echo $column_price; ?>:</b></p>
											<p><?php echo $product['price']; ?></p>
										</td>
										<td class="left-align">
											<p><b><?php echo $column_total; ?>:</b></p>
											<p><?php echo $product['total']; ?></p>
										</td>
										<td class="right-align" style="white-space: nowrap;">
											<?php if ($product['reorder']) { ?>
												<a href="<?php echo $product['reorder']; ?>" data-position="top" data-delay="50" data-tooltip="<?php echo $button_reorder; ?>" class="btn btn-margin element-theme tooltipped"><i class="material-icons">shopping_cart</i></a>
											<?php } ?>
											<a href="<?php echo $product['return']; ?>" data-position="top" data-delay="50" data-tooltip="<?php echo $button_return; ?>" class="btn btn-margin element-theme tooltipped"><i class="material-icons">reply</i></a>
										</td>
									</tr>
								<?php } ?>
								<?php foreach ($vouchers as $voucher) { ?>
									<tr>
										<td class="left-align"><?php echo $voucher['description']; ?></td>
										<td class="left-align"></td>
										<td class="left-align">1</td>
										<td class="left-align"><?php echo $voucher['amount']; ?></td>
										<td class="left-align"><?php echo $voucher['amount']; ?></td>
										<td></td>
									</tr>
								<?php } ?>
							</tbody>
						</table>
					</p>
					<p>
						<?php foreach ($totals as $total) { ?>
							<p><b><?php echo $total['title']; ?>:</b> <?php echo $total['text']; ?></p>
						<?php } ?>
					</p>
					<p>
						<?php if ($comment) { ?>
							<p><b><?php echo $text_comment; ?>:</b></p>
							<p><?php echo $comment; ?></p>
						<?php } ?>
					</p>
					<?php if ($histories) { ?>
						<span class="card-title"><small><?php echo $text_history; ?></small></span>
						<table class="responsive-table">
							<tbody>
								<?php foreach ($histories as $history) { ?>
									<tr>
										<td class="left-align">
											<p><b><?php echo $column_date_added; ?>:</b></p>
											<p><?php echo $history['date_added']; ?></p>
										</td>
										<td class="left-align">
											<p><b><?php echo $column_status; ?>:</b></p>
											<p><?php echo $history['status']; ?></p>
										</td>
										<td class="left-align">
											<p><b><?php echo $column_comment; ?>:</b></p>
											<p><?php echo $history['comment']; ?></p>
										</td>
									</tr>
								<?php } ?>
							</tbody>
						</table>
					<?php } ?>
				</p>
			</div>
			<div class="card-action">
				<a class="clickable" href="<?php echo $continue; ?>"><?php echo $button_continue; ?></a>
			</div>
		</div>
		</form>
	</div>
</div>
</div>
</main>
<?php echo $footer; ?>