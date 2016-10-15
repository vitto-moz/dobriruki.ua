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
					<p><?php echo $entry_newsletter; ?></p>
					<fieldset class="border-none">
					<?php if ($newsletter) { ?>
						<p>
							<input name="newsletter" type="radio" value="1" checked="checked" id="yes"/>
							<label for="yes"><?php echo $text_yes; ?></label>
						</p>
						<p>
							<input name="newsletter" type="radio" value="0" id="no"/>
							<label for="no"><?php echo $text_no; ?></label>
						</p>
					<?php } else { ?>
						<p>
							<input name="newsletter" type="radio" value="1" id="yes"/>
							<label for="yes"><?php echo $text_yes; ?></label>
						</p>
						<p>
							<input name="newsletter" type="radio" value="0" checked="checked" id="no"/>
							<label for="no"><?php echo $text_no; ?></label>
						</p>
					<?php } ?>
					</fieldset>
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