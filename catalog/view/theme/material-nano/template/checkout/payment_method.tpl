<?php if ($error_warning) { ?>
	<script type="text/javascript">
		Materialize.toast('<span class="text-select-none"><?php echo $error_warning; ?></span>', toastTime);
	</script>
<?php } ?>

<div class="card white">
	<div class="card-content">
		<?php if ($payment_methods) { ?>
			<span class="card-title"><?php echo $text_payment_method; ?></span>
			<fieldset class="border-none">
				<?php foreach ($payment_methods as $payment_method) { ?>
					<?php if ($payment_method['code'] == $code || !$code) { ?>
						<p>
							<input name="payment_method" type="radio" id="payment_method_<?php echo $payment_method['code']; ?>" value="<?php echo $payment_method['code']; ?>" checked="checked" />
							<label for="payment_method_<?php echo $payment_method['code']; ?>">
								<?php echo $payment_method['title']; ?>
								<?php if ($payment_method['terms']) { ?>
									(<?php echo $payment_method['terms']; ?>)
								<?php } ?>
							</label>
						</p>
					<?php } else { ?>
						<p>
							<input name="payment_method" type="radio" id="payment_method_<?php echo $payment_method['code']; ?>" value="<?php echo $payment_method['code']; ?>" checked="checked" />
							<label for="payment_method_<?php echo $payment_method['code']; ?>">
								<?php echo $payment_method['title']; ?>
								<?php if ($payment_method['terms']) { ?>
									(<?php echo $payment_method['terms']; ?>)
								<?php } ?>
							</label>
						</p>
					<?php } ?>
				<?php } ?>
			</fieldset>
		<?php } ?>
		<div class="input-field">
			<textarea name="comment" rows="8" id="input-payment-comment" class="materialize-textarea"><?php echo $comment; ?></textarea>
			<label for="input-payment-comment"><?php echo $text_comments; ?></label>
		</div>
		<?php if ($text_agree) { ?>
			<div class="input-field">
				<?php if ($agree) { ?>
					<input type="checkbox" name="agree" value="1" id="input-payment-agree" checked="checked" />
					<label for="input-payment-agree" class="text-select-none"><?php echo $text_agree; ?></label>
				<?php } else { ?>
					<input type="checkbox" name="agree" value="1" id="input-payment-agree" />
					<label for="input-payment-agree" class="text-select-none"><?php echo $text_agree; ?></label>
				<?php } ?>
			</div>
		<?php } ?>
	</div>
	<div class="card-action">
		<a class="clickable" id="button-payment-method"><?php echo $button_continue; ?></a>
	</div>
</div>