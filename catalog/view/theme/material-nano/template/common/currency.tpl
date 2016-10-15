<?php if (count($currencies) > 1 ) { ?>
<div id="modal-currency" class="modal">
	<div class="modal-content">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
			<h5><?php echo $text_currency; ?></h5>
			<p>
				<div class="collection">
					<?php foreach ($currencies as $currency) { ?>
						<?php if ($currency['symbol_left']) { ?>
								<a class="currency-select collection-item" href="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?>&nbsp;<?php echo $currency['title']; ?></a>
						<?php } else { ?>
								<a class="currency-select collection-item" href="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?>&nbsp;<?php echo $currency['symbol_right']; ?> </a>
						<?php } ?>
					<?php } ?>
				</div>
			</p>
			<input type="hidden" name="code" value="" />
			<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
		</form>
	</div>
</div>
<?php } ?>
