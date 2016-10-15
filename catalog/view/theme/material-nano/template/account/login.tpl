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
		<div class="card white">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
			<div class="card-content">
				<span class="card-title"><?php echo $text_returning_customer; ?></span>
				<p class="text-select-none"><?php echo $text_i_am_returning_customer; ?></p>
				<p>
					<div class="input-field required">
						<input id="email" type="email" name="email" value="<?php echo $email; ?>" />
						<label for="email"><?php echo $entry_email; ?></label>
					</div>
					<div class="input-field required">
						<input id="password" type="password" name="password" value="<?php echo $password; ?>" />
						<label for="password"><?php echo $entry_password; ?></label>
					</div>
				</p>
			</div>
			<div class="card-action">
				<a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
				<a class="submit-link clickable"><?php echo $button_login; ?></a>
			</div>
			<?php if ($redirect) { ?>
				<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
			<?php } ?>
		</form>
		</div>
	</div>
	<div class="col s12 m12 l12">
		<div class="card white">
			<div class="card-content">
				<span class="card-title"><?php echo $text_new_customer; ?></span>
				<p class="text-select-none"><?php echo $text_register; ?></p>
				<p class="text-select-none"><?php echo $text_register_account; ?></p>
			</div>
			<div class="card-action">
				<a href="<?php echo $register; ?>"><?php echo $button_continue; ?></a>
			</div>
		</div>
	</div>
</div>
</div>
</main>
<?php echo $footer; ?>
