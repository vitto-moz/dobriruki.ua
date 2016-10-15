<?php echo $header; ?>
<main>
<div class="container">
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
					<p><?php echo $text_email; ?></p>
					<div class="input-field required">
						<input type="email" name="email" value="" id="input-email" />
						<label for="input-email"><?php echo $entry_email; ?></label>
					</div>
				</p>
			</div>
			<div class="card-action">
				<a href="<?php echo $back; ?>"><?php echo $button_back; ?></a>
				<a class="submit-link clickable"><?php echo $button_continue; ?></a>
			</div>
		</div>
		</form>
	</div>
</div>
</div>
</main>
<?php echo $footer; ?>
