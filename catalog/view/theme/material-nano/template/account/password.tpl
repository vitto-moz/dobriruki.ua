<?php echo $header; ?>
<main>
<div class="container">
<div class="row">
	<div class="col s12 m12 l12">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		<div class="card white">
			<div class="card-content">
				<span class="card-title"><?php echo $heading_title; ?></span>
				<p>
					<div class="input-field required">
						<input type="password" name="password" id="input-password" value="<?php echo $password; ?>" />
						<label for="input-password"><?php echo $entry_password; ?></label>
						<?php if ($error_password) { ?>
							<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">error</i><?php echo $error_password; ?></span>', toastTime)</script>
						<?php } ?>
					</div>
					<div class="input-field required">
						<input type="password" name="confirm" id="input-confirm" value="<?php echo $confirm; ?>" />
						<label for="input-confirm"><?php echo $entry_confirm; ?></label>
						<?php if ($error_confirm) { ?>
							<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">error</i><?php echo $error_confirm; ?></span>', toastTime)</script>
						<?php } ?>
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
