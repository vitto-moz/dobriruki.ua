<?php echo $header; ?>
<main>
<div class="container">
<?php if ($success) { ?>
	<script type="text/javascript">
		Materialize.toast('<span class="text-select-none"><i class="left material-icons">done_all</i><?php echo $success; ?></span>', toastTime);
	</script>
<?php } ?>
<div class="row">
	<div class="col s12 m12 l12">
		<div class="card white">
			<div class="card-content">
				<span class="card-title"><?php echo $text_my_account; ?></span>
				<p>
					<div class="collection">
						<a class="collection-item" href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a>
						<a class="collection-item" href="<?php echo $password; ?>"><?php echo $text_password; ?></a>
						<a class="collection-item" href="<?php echo $address; ?>"><?php echo $text_address; ?></a>
						<a class="collection-item" href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a>
						<a class="collection-item" href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a>
						<a class="collection-item" href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
					</div>
				</p>
			</div>
		</div>
	</div>
</div>
</div>
</main>
<?php echo $footer; ?>
