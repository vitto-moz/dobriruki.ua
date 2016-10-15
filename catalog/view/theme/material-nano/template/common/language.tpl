<?php if (count($languages) > 1) { ?>
<div id="modal-language" class="modal">
	<div class="modal-content">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
			<h5><?php echo $text_language; ?></h5>
			<p>
				<div class="collection">
					<?php foreach ($languages as $language) { ?>
						<a class="language-select collection-item" href="<?php echo $language['code']; ?>"><img src="image/flags/<?php echo $language['image']; ?>" />&nbsp;<?php echo $language['name']; ?></a>
					<?php } ?>
				</div>
			</p>
			<input type="hidden" name="code" value="" />
			<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
		</form>
	</div>
</div>
<?php } ?>
