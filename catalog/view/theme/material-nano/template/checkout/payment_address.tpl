<div class="card white">
	<form>
		<div class="card-content">
			<?php if ($addresses) { ?>
				<p>
					<input type="radio" name="payment_address" id="payment_address_existing" value="existing" checked="checked" />
					<label for="payment_address_existing"><?php echo $text_address_existing; ?></label>
				</p>
				<p>
					<input type="radio" name="payment_address" id="payment_address_new" value="new" />
					<label for="payment_address_new"><?php echo $text_address_new; ?></label>
				</p>
				<div class="input-field" id="payment-existing">
					<select name="address_id" id="select-payment-existing">
						<?php foreach ($addresses as $address) { ?>
							<?php if ($address['address_id'] == $address_id) { ?>
								<option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
							<?php } else { ?>
								<option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
							<?php } ?>
						<?php } ?>
					</select>
				</div>
			<?php } ?>
			<div id="payment-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
				<div class="input-field required">
					<input type="text" name="firstname" id="input-payment-firstname" value="" />
					<label for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
				</div>
				<div class="input-field required">
					<input type="text" name="lastname" id="input-payment-lastname" value="" />
					<label for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
				</div>
				<div class="input-field">
					<input type="text" name="company"  id="input-payment-company" value="" />
					<label for="input-payment-company"><?php echo $entry_company; ?></label>
				</div>
				<div class="input-field required">
					<input type="text" name="address_1"  id="input-payment-address-1" value="" />
					<label for="input-payment-address-1"><?php echo $entry_address_1; ?></label>
				</div>
				<div class="input-field">
					<input type="text" name="address_2" value="" id="input-payment-address-2" />
					<label for="input-payment-address-2"><?php echo $entry_address_2; ?></label>
				</div>
				<div class="input-field required">
					<input type="text" name="city" id="input-payment-city" value="" />
					<label for="input-payment-city"><?php echo $entry_city; ?></label>
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
				<div class="input-field" id="tagInputZone"></div>
			</div>
		</div>
		<div class="card-action">
			<a class="clickable" id="button-payment-address"><?php echo $button_continue; ?></a>
		</div>
	</form>
</div>
<script type="text/javascript"><!--
$(document).ready(function(){
	$('#payment-address .input-field').each(function(){
		if($(this).hasClass('required')){
			$(this).find('label').prepend('<span style="color: red;">* </span>');
		}
	});
});

$(document).ready(function(){
	$('#payment-address #input-country').material_select();
	$('#payment-address #input-country').on('change', function(){
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
				$('#payment-address #tagInputZone').html(codeInput);
				$('#payment-address #input-zone').material_select();
			},
			error: function(xhr, ajaxOptions, thrownError) {
				Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i>' + thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText + '</span>', toastTime);
			}
		});
	});
});
$('#payment-address #input-country').trigger('change');
/*===========================*/


$(document).ready(function(){
$('#payment-address #select-payment-existing').material_select();
$('#payment-address input[name=\'payment_address\']').on('change', function() {
	if (this.value == 'new') {
		$('#payment-existing').hide();
		$('#payment-new').show();
	}
	if (this.value == 'existing') {
		$('#payment-existing').show();
		$('#payment-new').hide();
	}
});
});
//--></script>
<script type="text/javascript"><!--
$(document).ready(function(){
	$('#payment-address select').material_select();
});
//--></script>