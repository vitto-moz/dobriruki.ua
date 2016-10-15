<span class="card-title"><?php echo $text_instruction; ?></span>
<div class="well well-sm">
  <p><b><?php echo $text_payable; ?></b></p>
  <p><?php echo $payable; ?></p>
  <p><b><?php echo $text_address; ?></b></p>
  <p><?php echo $address; ?></p>
  <p><?php echo $text_payment; ?></p>
</div>
<div class="input-field">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn element-theme" />
</div>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	$.ajax({
		type: 'get',
		url: 'index.php?route=payment/cheque/confirm',
		cache: false,
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},
		success: function() {
			location = '<?php echo $continue; ?>';
		}
	});
});
//--></script>
