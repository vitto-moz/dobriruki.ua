<form id="payment" >
	<span class="card-title"><?php echo $text_credit_card; ?></span>
	<div class="input-field required">
		<input type="text" name="cc_owner" value="" id="input-cc-owner" />
		<label for="input-cc-owner"><?php echo $entry_cc_owner; ?></label>
	</div>
	<div class="input-field required">
		<input type="text" name="cc_number" value="" id="input-cc-number" />
		<label for="input-cc-number"><?php echo $entry_cc_number; ?></label>
    </div>
	<div class="input-field required">
		<select name="cc_expire_date_month" id="input-cc-expire-date">
			<?php foreach ($months as $month) { ?>
				<option value="<?php echo $month['value']; ?>"><?php echo $month['text']; ?></option>
			<?php } ?>
		</select>
		<label><?php echo $entry_cc_expire_date; ?></label>
	</div>
	<div class="input-field">
		<select name="cc_expire_date_year">
			<?php foreach ($year_expire as $year) { ?>
				<option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
			<?php } ?>
		</select>
		<label><?php echo $entry_cc_expire_date; ?></label>
	</div>
	<div class="input-field required">
		<input type="text" name="cc_cvv2" value="" id="input-cc-cvv2" />
		<label for="input-cc-cvv2"><?php echo $entry_cc_cvv2; ?></label>
	</div>
</form>
<div class="input-field">
	<input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn element-theme" />
</div>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	$.ajax({
		url: 'index.php?route=payment/authorizenet_aim/send',
		type: 'post',
		data: $('#payment :input'),
		dataType: 'json',
		cache: false,		
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},			
		success: function(json) {
			if (json['error']) {
				Materialize.toast('<span class="text-select-none">' + json['error'] + '</span>', toastTime);
			}
			
			if (json['redirect']) {
				location = json['redirect'];
			}
		}
	});
});
$('#payment select').each(function(){
		$(this).material_select();
	});
//--></script>