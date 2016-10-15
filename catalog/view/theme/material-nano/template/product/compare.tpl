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
						<div class="input-field">
							<select id="select-compare">
								<option value="price"><?php echo $text_price; ?></option>
								<option value="model"><?php echo $text_model; ?></option>
								<option value="manufacturer"><?php echo $text_manufacturer; ?></option>
								<option value="availability"><?php echo $text_availability; ?></option>
								<?php if ($review_status) { ?>
									<option value="rating"><?php echo $text_rating; ?></option>
								<?php } ?>
								<option value="summary"><?php echo $text_summary; ?></option>
								<option value="weight"><?php echo $text_weight; ?></option>
								<option value="dimension"><?php echo $text_dimension; ?></option>
								<?php if ($attribute_groups) { ?>
									<?php $count_attribute = 0; ?>
									<?php foreach ($attribute_groups as $attribute_group) { ?>
										<?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
											<?php $count_attribute++; ?>
											<option value="attribute-<?php echo $count_attribute; ?>"><?php echo $attribute_group['name']; ?> / <?php echo $attribute['name']; ?></option>
										<?php } ?>
									<?php } ?>
								<?php } ?>
							</select>
							<label><?php echo $text_product; ?></label>
						</div>
						<table class="responsive-table">
							<tbody>
								<?php foreach ($products as $product) { ?>
									<tr>
										<td>
											<a class="default-link" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
										</td>
										<td id="price" class="display-none hidden-content price">
											<?php if ($product['price']) { ?>
												<?php if (!$product['special']) { ?>
													<p><?php echo $product['price']; ?></p>
												<?php } else { ?>
													<p><?php echo $product['special']; ?> <strike><?php echo $product['price']; ?></strike></p>
												<?php } ?>
											<?php } ?>
										</td>
										<td id="model" class="display-none hidden-content model">
											<p><?php echo $product['model']; ?></p>
										</td>
										<td id="manufacturer" class="display-none hidden-content manufacturer">
											<p><?php echo $product['manufacturer']; ?></p>
										</td>
										<td id="availability" class="display-none hidden-content availability">
											<p><?php echo $product['availability']; ?></p>
										</td>
										<?php if ($review_status) { ?>
											<td id="rating" class="display-none hidden-content rating">
												<?php if ($product['rating']) { ?>
													<p><script type="text/javascript">showRating(<?php echo $product['rating']; ?>);</script></p>
												<?php } else { ?>
													<p><script type="text/javascript">showRating(0);</script></p>
												<?php } ?>
												<p><?php echo $product['reviews']; ?></p>
											</td>
										<?php } ?>
										<td id="description" class="display-none hidden-content summary">
											<p><?php echo $product['description']; ?></p>
										</td>
										<td id="weight" class="display-none hidden-content weight">
											<p><?php echo $product['weight']; ?></p>
										</td>
										<td id="dimension" class="display-none hidden-content dimension">
											<p><?php echo $product['length']; ?> x <?php echo $product['width']; ?> x <?php echo $product['height']; ?></p>
										</td>
										<?php if ($attribute_groups) { ?>
											<?php $count_td = 0; ?>
											<?php foreach ($attribute_groups as $attribute_group) { ?>
												<?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
													<?php $count_td++; ?>
													<td id="attribute-<?php echo $count_td; ?>" class="display-none hidden-content attribute-<?php echo $count_td; ?>">
														<?php if (isset($product['attribute'][$key])) { ?>
															<?php echo $product['attribute'][$key]; ?>
														<?php } else { ?>
															<p>-</p>
														<?php } ?>
													</td>
												<?php } ?>
											<?php } ?>
										<?php } ?>
										<td class="right-align">
											<a class="btn btn-margin element-theme tooltipped" onclick="cart.add('<?php echo $product['product_id']; ?>');" data-position="top" data-delay="50" data-tooltip="<?php echo $button_cart; ?>"><i class="material-icons">shopping_cart</i></a>
											<a class="btn btn-margin element-theme tooltipped" href="<?php echo $product['remove']; ?>" data-position="top" data-delay="50" data-tooltip="<?php echo $button_remove; ?>"><i class="material-icons">delete</i></a>
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
		</div>
	</div>
</div>
</div>
</main>

<script type="text/javascript">
$(document).ready(function(){
	$('#select-compare').on('change', function(){
		$('.hidden-content').each(function(){
			$(this).hide();
		});
		$('.' + $(this).val()).each(function(){
			$(this).show();
		});
	});
	$('#select-compare').trigger('change');
});
</script>
<?php echo $footer; ?>
