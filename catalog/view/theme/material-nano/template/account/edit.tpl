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

						<span class="card-title"><small><?php echo $text_your_details; ?></small></span>
						<div class="input-field required">
							<input type="text" name="firstname" id="input-firstname" value="<?php echo $firstname; ?>" />
							<label for="input-firstname"><?php echo $entry_firstname; ?></label>
							<?php if ($error_firstname) { ?>
              	<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">error</i><?php echo $error_firstname; ?></span>', toastTime)</script>
              <?php } ?>
						</div>
						<div class="input-field required">
							<input type="text" name="lastname" id="input-lastname" value="<?php echo $lastname; ?>" />
							<label for="input-lastname"><?php echo $entry_lastname; ?></label>
							<?php if ($error_lastname) { ?>
              	<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">error</i><?php echo $error_lastname; ?></span>', toastTime)</script>
              <?php } ?>
						</div>
						<div class="input-field required">
							<input type="email" name="email" id="input-email" value="<?php echo $email; ?>" />
							<label for="input-email"><?php echo $entry_email; ?></label>
							<?php if ($error_email) { ?>
              	<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">error</i><?php echo $error_email; ?></span>', toastTime)</script>
             	<?php } ?>
						</div>
						<div class="input-field required">
							<input type="text" name="telephone" id="input-telephone" value="<?php echo $telephone; ?>" />
							<label for="input-telephone"><?php echo $entry_telephone; ?></label>
              <?php if ($error_telephone) { ?>
              	<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">error</i><?php echo $error_telephone; ?></span>', toastTime)</script>
              <?php } ?>
						</div>
						<div class="input-field">
							<input type="text" name="fax" id="input-fax" value="<?php echo $fax; ?>" />
							<label for="input-fax"><?php echo $entry_fax; ?></label>
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