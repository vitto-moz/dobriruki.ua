<?php echo $header; ?>
<main>
<div class="container">
	<div class="row">
		<div class="col s12 m12 l12">
			<div class="card white">
				<div class="card-content">
					<span class="card-title"><?php echo $heading_title; ?></span>
					<p>
						<?php if ($orders) { ?>
							<table class="responsive-table">
								<tbody>
									<?php foreach ($orders as $order) { ?>
									<tr>
										<td class="left-align"><p><b><?php echo $column_order_id; ?>:</b></p><p>#<?php echo $order['order_id']; ?></p></td>
										<td class="left-align"><p><b><?php echo $column_status; ?>:</b></p><p><?php echo $order['status']; ?></p></td>
										<td class="left-align"><p><b><?php echo $column_date_added; ?>:</b></p><p><?php echo $order['date_added']; ?></p></td>
										<td class="left-align"><p><b><?php echo $column_product; ?>:</b></p><p><?php echo $order['products']; ?></p></td>
										<td class="left-align"><p><b><?php echo $column_customer; ?>:</b></p><p><?php echo $order['name']; ?></p></td>
										<td class="left-align"><p><b><?php echo $column_total; ?>:</b></p><p><?php echo $order['total']; ?></p></td>
										<td class="right-align"><a href="<?php echo $order['href']; ?>" data-position="top" data-delay="50" data-tooltip="<?php echo $button_view; ?>" class="btn btn-margin element-theme tooltipped"><i class="material-icons">remove_red_eye</i></a></td>
									</tr>
									<?php } ?>
								</tbody>
							</table>
							<div class="col s12 m12 l12 centered"><?php echo $pagination; ?></div>
						<?php } else { ?>
							<?php echo $text_empty; ?>
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