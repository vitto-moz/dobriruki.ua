<?php echo $header; ?>
<main>
<div class="container">
<div class="row">
	<div class="col s12 m12 l12">
		<div class="card white">
			<div class="card-content">
				<span class="card-title"><?php echo $heading_title; ?></span>
				<p>
					<span class="card-title"><small><?php echo $text_location; ?></small></span>
					<?php if ($image) { ?>
						<p><img src="<?php echo $image; ?>" title="<?php echo $store; ?>" /></p>
					<?php } ?>
					<p><?php echo $store; ?></p>
					<p><?php echo $address; ?></p>
					<p><b><?php echo $text_telephone; ?>:</b></p>
					<p><?php echo $telephone; ?></p>
					<?php if ($fax) { ?>
						<p><b><?php echo $text_fax; ?>:</b></p>
						<p><?php echo $fax; ?></p>
					<?php } ?>
					<?php if ($open) { ?>
						<p><b><?php echo $text_open; ?>:</b></p>
						<p><?php echo $open; ?></p>
					<?php } ?>
					<?php if ($comment) { ?>
						<p><b><?php echo $text_comment; ?>:</b></p>
						<p><?php echo $comment; ?></p>
					<?php } ?>
				</p>
			</div>
			<?php if ($geocode) { ?>
				<div class="card-action">
					<a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=<?php echo $geocode_hl; ?>&t=m&z=15" target="_blank"><?php echo $button_map; ?></a>
				</div>
			<?php } ?>
		</div>
	</div>

	<div class="col s12 m12 l12">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		<div class="card white">
			<div class="card-content">
				<span class="card-title"><?php echo $text_contact; ?> </span>
				<p>
					<div class="input-field required">
						<input type="text" name="name" id="name" value="<?php echo $name; ?>" />
						<label for="name"><?php echo $entry_name; ?></label>
						<?php if ($error_name) { ?>
							<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_name; ?></span>', toastTime)</script>
						<?php } ?>
					</div>
					<div class="input-field required">
						<input type="email" name="email" id="email" value="<?php echo $email; ?>" />
						<label for="email"><?php echo $entry_email; ?></label>
						<?php if ($error_email) { ?>
							<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_email; ?></span>', toastTime)</script>
						<?php } ?>
					</div>
					<div class="input-field required">
						<textarea class="materialize-textarea" name="enquiry" id="enquiry" rows="10"><?php echo $enquiry; ?></textarea>
						<label for="enquiry"><?php echo $entry_enquiry; ?></label>
						<?php if ($error_enquiry) { ?>
							<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_enquiry; ?></span>', toastTime)</script>
						<?php } ?>
					</div>
					<div class="input-field required">
						<input type="text" name="captcha" id="input-captcha" />
						<label for="input-captcha"><?php echo $entry_captcha; ?></label>
					</div>
					<div class="input-field">
						<img src="index.php?route=tool/captcha" alt="" />
						<?php if ($error_captcha) { ?>
							<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_captcha; ?></span>', toastTime)</script>
						<?php } ?>
					</div>
				</p>
			</div>
			<div class="card-action">
				<a class="submit-link clickable"><?php echo $button_submit; ?></a>
			</div>
		</div>
		</form>
	</div>
	</div>
</div>
</main>
<?php echo $footer; ?>
