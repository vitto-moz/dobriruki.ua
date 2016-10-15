<div class="card white">
	<div class="card-content">
		<div id="account">
			<span class="card-title"><?php echo $text_your_details; ?></span>
			<p>
			<fieldset class="border-none" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
			<p><?php echo $entry_customer_group; ?></p>
			<?php foreach ($customer_groups as $customer_group) { ?>
				<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
					<p>
						<input name="customer_group_id" type="radio" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id_<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
						<label for="customer_group_id_<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
					</p>
				<?php } else { ?>
					<p>
						<input name="customer_group_id" type="radio" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id_<?php echo $customer_group['customer_group_id']; ?>" />
						<label for="customer_group_id_<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
					</p>
				<?php } ?>
			<?php } ?>
		</fieldset>
		<div class="input-field required">
			<input type="text" name="firstname" value="" id="input-payment-firstname" />
			<label for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
		</div>
		<div class="input-field required">
			<input type="text" name="lastname" value="" id="input-payment-lastname" />
			<label for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
		</div>
		<div class="input-field required">
			<input type="text" name="email" value="" id="input-payment-email" />
			<label for="input-payment-email"><?php echo $entry_email; ?></label>
		</div>
		<div class="input-field required">
			<input type="text" name="telephone" value="" id="input-payment-telephone" />
			<label for="input-payment-telephone"><?php echo $entry_telephone; ?></label>
		</div>
		<div class="input-field">
			<input type="text" name="fax" value="" id="input-payment-fax" />
			<label for="input-payment-fax"><?php echo $entry_fax; ?></label>
		</div>
			</p>
		</div>
		<span class="card-title"><?php echo $text_your_password; ?></span>
		<div class="input-field required">
			<input type="password" name="password" value="" id="input-payment-password" />
			<label for="input-payment-password"><?php echo $entry_password; ?></label>
		</div>
		<div class="input-field required">
			<input type="password" name="confirm" value="" id="input-payment-confirm" />
			<label for="input-payment-confirm"><?php echo $entry_confirm; ?></label>
		</div>
		<div id="address">
			<span class="card-title"><?php echo $text_your_address; ?></span>
			<p>
				<div class="input-field">
				<input type="text" name="company" value="" id="input-payment-company" />
				<label for="input-payment-company"><?php echo $entry_company; ?></label>
			</div>
			<div class="input-field required">
				<input type="text" name="address_1" value="" id="input-payment-address-1" />
				<label for="input-payment-address-1"><?php echo $entry_address_1; ?></label>
			</div>
			<div class="input-field">
				<input type="text" name="address_2" value="" id="input-payment-address-2" />
				<label for="input-payment-address-2"><?php echo $entry_address_2; ?></label>
			</div>
			<div class="input-field required">
				<input type="text" name="city" value="" id="input-payment-city" />
				<label for="input-payment-city"><?php echo $entry_city; ?></label>
			</div>
			<div class="input-field required">
				<input type="text" name="postcode" value="<?php echo $postcode; ?>" id="input-payment-postcode" />
				<label for="input-payment-postcode"><?php echo $entry_postcode; ?></label>
			</div>
			<div class="input-field required" id="tagInputCountry">
				<select name="country_id" id="input-country">
					<option value="" selected disabled><?php echo $text_select; ?></option>
					<?php foreach ($countries as $country) { ?>
						<?php if ($country['country_id'] == $country_id) { ?>
							<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
						<?php } else { ?>
							<option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
						<?php } ?>
					<?php } ?>
				</select>
				<label><?php echo $entry_country; ?></label>
			</div>
			<div class="input-field required" id="tagInputZone"></div>
			</p>
		</div>
		<p><?php echo $captcha; ?></p>
		<div class="input-field">
			<input type="checkbox" name="newsletter" value="1" id="newsletter" />
			<label for="newsletter"><?php echo $entry_newsletter; ?></label>
		</div>
		<?php if ($shipping_required) { ?>
			<div class="input-field">
				<input type="checkbox" name="shipping_address" id="checkbox_shipping_address" value="1" checked="checked" />
				<label for="checkbox_shipping_address"><?php echo $entry_shipping; ?></label>
			</div>
		<?php } ?>
		<?php if ($text_agree) { ?>
			<div class="input-field">
				<input type="checkbox" name="agree" id="input-agree" value="1" />
				<label class="text-select-none" for="input-agree"><?php echo $text_agree; ?></label>
			</div>
		<?php } ?>
	</div>
	<div class="card-action">
		<a class="clickable" id="button-register"><?php echo $button_continue; ?></a>
	</div>
</div>

<script type="text/javascript"><!--
$(document).ready(function(){
	$('.input-field').each(function(){
		if($(this).hasClass('required')){
			$(this).find('label').prepend('<span style="color: red;">* </span>');
		}
	});
});

$(document).ready(function(){
$('input [name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},
		success: function(json) {
			$('.custom-field-account').hide();
			$('.custom-field-account').removeClass('required');
			$('.custom-field-address').hide();
			$('.custom-field-address').removeClass('required');
			for (i = 0; i < json.length; i++) {
				custom_field = json[i];
				$('#custom-field' + custom_field['custom_field_id']).show();
				if (custom_field['required']) {
					$('#custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			Materialize.toast('<span class="text-select-none">' + thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText + '</span>', toastTime);
		}
	});
});
$('input[name=\"customer_group_id\']:checked').trigger('change');
});
//--></script>

<script type="text/javascript"><!--
$(document).ready(function(){
	$('#input-country').material_select();
	$('#input-country').on('change', function(){
		$.ajax({
			url: 'index.php?route=account/account/country&country_id=' + this.value,
			dataType: 'json',
			beforeSend: function(){
				$('#nav-preloader').show();
			},
			complete: function(){
				$('#nav-preloader').hide();
			},
			success: function(json){
				var codeInput = '<select name="zone_id" id="input-zone"><option selected disabled><?php echo $text_select; ?></option>';
				if (json['zone'] && json['zone'] != '') {
					for (i = 0; i < json['zone'].length; i++) {
						codeInput += '<option value="' + json['zone'][i]['zone_id'] + '">' + json['zone'][i]['name'] + '</option>';
					}
				} else {
					codeInput += '<option value="0" selected><?php echo $text_none; ?></option>';
				}
				codeInput += '</select><label><span style="color: red;">* </span><?php echo $entry_zone; ?></label>';
				$('#tagInputZone').html(codeInput);
				$('#input-zone').material_select();
			},
			error: function(xhr, ajaxOptions, thrownError) {
				Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i>' + thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText + '</span>', toastTime);
			}
		});
	});
});
$('#input-country').trigger('change');

$(document).ready(function(){
	$('select').material_select();
});
//--></script>
