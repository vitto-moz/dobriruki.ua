<div class="card white">
	<div class="card-content">
		<span class="card-title"><?php echo $text_new_customer; ?></span>
		<p><?php echo $text_checkout; ?></p>
		<fieldset class="border-none">
			<?php if ($account == 'register') { ?>
				<p>
					<input type="radio" name="account" id="account_register" value="register" checked="checked" />
					<label for="account_register"><?php echo $text_register; ?></label>
				</p>
			<?php } else { ?>
				<p>
					<input type="radio" name="account" id="account_register" value="register" />
					<label for="account_register"><?php echo $text_register; ?></label>
				</p>
			<?php } ?>
			<?php if ($checkout_guest) { ?>
				<?php if ($account == 'guest') { ?>
					<p>
						<input type="radio" name="account" id="account_guest" value="guest" checked="checked" />
						<label for="account_guest"><?php echo $text_guest; ?></label>
					</p>
				<?php } else { ?>
					<p>
						<input type="radio" name="account" id="account_guest" value="guest" />
						<label for="account_guest"><?php echo $text_guest; ?></label>
					</p>
				<?php } ?>
			<?php } ?>
		</fieldset>
		<p><?php echo $text_register_account; ?></p>
	</div>
	<div class="card-action">
		<a class="clickable" id="button-account"><?php echo $button_continue; ?></a>
	</div>
</div>

<div class="card white">
	<div class="card-content">
		<span class="card-title"><?php echo $text_returning_customer; ?></span>
		<p><?php echo $text_i_am_returning_customer; ?></p>
		<div class="input-field">
			<label for="input-email"><?php echo $entry_email; ?></label>
			<input type="text" name="email" value="" id="input-email" />
		</div>
		<div class="input-field">
			<label for="input-password"><?php echo $entry_password; ?></label>
			<input type="password" name="password" value="" id="input-password" />
		</div>
	</div>
	<div class="card-action">
		<a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
		<a class="clickable" id="button-login"><?php echo $button_login; ?></a>
	</div>
</div>