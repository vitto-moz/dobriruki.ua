<div class="card white">
	<div class="card-content">
		<p>
			<?php if (!isset($redirect)) { ?>
	<table class="responsive-table">
		<tbody>
			<?php foreach ($products as $product) { ?>
				<tr>
					<td class="left-align">
					 <p><b><?php echo $column_name; ?>:</b></p>
						<p><a class="default-link" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></p>
						<?php foreach ($product['option'] as $option) { ?>
							<p>&nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small></p>
						<?php } ?>
						<?php if($product['recurring']) { ?>
							<p><small><?php echo $text_recurring_item; ?>: <?php echo $product['recurring']; ?></small></p>
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
				</tr>
			<?php } ?>
		</tbody>
	</table>
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
	<p><?php echo $payment; ?></p>
<?php } else { ?>
<script type="text/javascript"><!--
location = '<?php echo $redirect; ?>';
//--></script>
<?php } ?>
		</p>
	</div>
</div>