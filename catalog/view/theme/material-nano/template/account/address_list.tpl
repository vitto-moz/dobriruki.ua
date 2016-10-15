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
			<div class="card-content">
				<span class="card-title"><?php echo $text_address_book; ?></span>
				<p>
					<?php if ($addresses) { ?>
						<table class="responsive-table">
							<tbody>
						<?php foreach ($addresses as $result) { ?>
								<tr>
									<td class="left-align"><?php echo $result['address']; ?></td>
									<td class="right-align">
										<a class="btn btn-margin element-theme tooltipped" href="<?php echo $result['update']; ?>" data-position="top" data-delay="50" data-tooltip="<?php echo $button_edit; ?>"><i class="material-icons">edit</i></a>
										<a class="btn btn-margin element-theme tooltipped" href="<?php echo $result['delete']; ?>" data-position="top" data-delay="50" data-tooltip="<?php echo $button_delete; ?>"><i class="material-icons">delete</i></a>
									</td>
								</tr>
						<?php } ?>
						</tbody>
						</table>
					<?php } else { ?>
						<p><?php echo $text_empty; ?></p>
					<?php } ?>
				</p>
			</div>
			<div class="card-action">
				<a href="<?php echo $back; ?>"><?php echo $button_back; ?></a>
				<a href="<?php echo $add; ?>"><?php echo $button_new_address; ?></a>
			</div>
		</div>
	</div>
</div>
</div>
</main>
<?php echo $footer; ?>