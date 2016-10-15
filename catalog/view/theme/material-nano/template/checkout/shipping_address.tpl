<div class="card white">
	<form>
		<div class="card-content">
			<p>
				<?php if ($addresses) { ?>
					<p>
						<input type="radio" name="shipping_address" value="existing" id="existing_shipping_address" checked="checked" />
						<label for="existing_shipping_address"><?php echo $text_address_existing; ?></label>
					</p>
					<p>
						<input type="radio" name="shipping_address" value="new" id="new_shipping_address" />
						<label for="new_shipping_address"><?php echo $text_address_new; ?></label>
					</p>
					<div class="input-field" id="shipping-existing">
						<select name="address_id" class="form-control">
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
				<div id="shipping-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
					<div class="input-field required">
						<input type="text" name="firstname" value="" id="input-shipping-firstname" />
						<label for="input-shipping-firstname"><?php echo $entry_firstname; ?></label>
					</div>
					<div class="input-field  required">
						<input type="text" name="lastname" value="" id="input-shipping-lastname" />
						<label for="input-shipping-lastname"><?php echo $entry_lastname; ?></label>
					</div>
					<div class="input-field">
						<input type="text" name="company" value="" id="input-shipping-company" />
						<label for="input-shipping-company"><?php echo $entry_company; ?></label>
					</div>
					<div class="input-field required">
						<input type="text" name="address_1" value="" id="input-shipping-address-1" />
						<label for="input-shipping-address-1"><?php echo $entry_address_1; ?></label>
					</div>
					<div class="input-field">
						<input type="text" name="address_2" value="" id="input-shipping-address-2" />
						<label for="input-shipping-address-2"><?php echo $entry_address_2; ?></label>
					</div>
					<div class="input-field required">
						<input type="text" name="city" value="" id="input-shipping-city" />
						<label for="input-shipping-city"><?php echo $entry_city; ?></label>
					</div>
					<div class="input-field required">
						<input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-shipping-postcode" class="form-control" />
						<label for="input-shipping-postcode"><?php echo $entry_postcode; ?></label>
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
			</p>
		</div>
		<div class="card-action">
			<a class="clickable" id="button-shipping-address"><?php echo $button_continue; ?></a>
		</div>
	</form>
</div>

<script type="text/javascript"><!--
$(document).ready(function(){
	$('#shipping-address .input-field').each(function(){
		if($(this).hasClass('required')){
			$(this).find('label').prepend('<span style="color: red;">* </span>');
		}
	});
});

$(document).ready(function(){
	$('#shipping-address #input-country').on('change', function(){
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
				$('#shipping-address #tagInputZone').html(codeInput);
				$('#shipping-address #input-zone').material_select();
			},
			error: function(xhr, ajaxOptions, thrownError) {
				Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i>' + thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText + '</span>', toastTime);
			}
		});
	});
});
$('#shipping-address #input-country').trigger('change');

$(document).ready(function(){
	$('#shipping-address input[name=\'shipping_address\']').on('change', function() {
		if (this.value == 'new') {
			$('#shipping-existing').hide();
			$('#shipping-new').show();
		} else {
			$('#shipping-existing').show();
			$('#shipping-new').hide();
		}
	});
});

$(document).ready(function(){
	$('#shipping-address select').material_select();
});
//--></script>
