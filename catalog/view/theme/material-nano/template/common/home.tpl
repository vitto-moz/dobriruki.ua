<?php echo $header; ?>
<main>
<div class="container">
	<div class="row">
		<?php if($content_top){ ?>
		<div class="col s12 m12 l12">
			<p><?php echo $content_top; ?></p>
		</div>
		<?php } ?>
		<?php if($content_bottom){ ?>
		<div class="col s12 m12 l12">
			<p><?php echo $content_bottom; ?></p>
		</div>
		<?php } ?>
	</div>
</div>
</main>
<?php echo $footer; ?>
