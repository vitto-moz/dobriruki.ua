<div class="input-field">
	<input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn element-theme" />
</div>
<script type="text/javascript"><!--
$(document).ready(function(){
$('#button-confirm').on('click', function() {
	$.ajax({
		type: 'get',
		url: 'index.php?route=payment/free_checkout/confirm',
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
});
//--></script>
