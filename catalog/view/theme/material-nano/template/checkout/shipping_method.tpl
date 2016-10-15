<?php if ($error_warning) { ?>
	<script type="text/javascript">
		Materialize.toast('<span class="text-select-none"><?php echo $error_warning; ?></span>', toastTime);
	</script>
<?php } ?>

<div class="card white">
	<div class="card-content">
		<?php if ($shipping_methods) { ?>
			<span class="card-title"><?php echo $text_shipping_method; ?></span>
			<?php foreach ($shipping_methods as $shipping_method) { ?>
				<p><?php echo $shipping_method['title']; ?></p>
				<?php if (!$shipping_method['error']) { ?>
					<fieldset class="border-none">
						<?php foreach ($shipping_method['quote'] as $quote) { ?>
							<?php if ($quote['code'] == $code || !$code) { ?>
								<p>
									<input type="radio" name="shipping_method" id="shipping_method_<?php echo $quote['code']; ?>" value="<?php echo $quote['code']; ?>" checked="checked" />
									<label for="shipping_method_<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?> - <?php echo $quote['text']; ?></label>
								</p>
							<?php } else { ?>
								<p>
									<input type="radio" name="shipping_method" id="shipping_method_<?php echo $quote['code']; ?>" value="<?php echo $quote['code']; ?>" />
									<label for="shipping_method_<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?> - <?php echo $quote['text']; ?></label>
								</p>
							<?php } ?>
						<?php } ?>
					</fieldset>
				<?php } else { ?>
					<p><?php echo $shipping_method['error']; ?></p>
				<?php } ?>
			<?php } ?>
		<?php } ?>
		<div class="input-field">
			<textarea class="materialize-textarea" name="comment" id="input-shipping-comment" rows="8"><?php echo $comment; ?></textarea>
			<label for="input-shipping-comment"><?php echo $text_comments; ?></label>
		</div>
	</div>
	<div class="card-action">
		<a class="clickable" id="button-shipping-method"><?php echo $button_continue; ?></a>
	</div>
</div>