<div class="card white">
	<form>
		<div class="card-content">
			<p>
				<div class="input-field required">
					<label for="input-shipping-firstname"><?php echo $entry_firstname; ?></label>
					<input type="text" name="firstname" value="<?php echo $firstname; ?>" id="input-shipping-firstname" />
				</div>
				<div class="input-field required">
					<label for="input-shipping-lastname"><?php echo $entry_lastname; ?></label>
					<input type="text" name="lastname" value="<?php echo $lastname; ?>" id="input-shipping-lastname" />
				</div>
				<div class="input-field">
					<label for="input-shipping-company"><?php echo $entry_company; ?></label>
					<input type="text" name="company" value="<?php echo $company; ?>" id="input-shipping-company" />
				</div>
				<div class="input-field required">
					<label for="input-shipping-address-1"><?php echo $entry_address_1; ?></label>
					<input type="text" name="address_1" value="<?php echo $address_1; ?>" id="input-shipping-address-1" />
				</div>
				<div class="input-field">
					<label for="input-shipping-address-2"><?php echo $entry_address_2; ?></label>
					<input type="text" name="address_2" value="<?php echo $address_2; ?>" id="input-shipping-address-2" />
				</div>
				<div class="input-field required">
					<label for="input-shipping-city"><?php echo $entry_city; ?></label>
					<input type="text" name="city" value="<?php echo $city; ?>" id="input-shipping-city" />
				</div>
				<div class="input-field required">
					<label for="input-shipping-postcode"><?php echo $entry_postcode; ?></label>
					<input type="text" name="postcode" value="<?php echo $postcode; ?>" id="input-shipping-postcode" />
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
		<div class="card-action">
			<a class="clickable" id="button-guest-shipping"><?php echo $button_continue; ?></a>
		</div>
	</form>
</div>

<script type="text/javascript"><!--
$(document).ready(function(){
	$('.input-field').each(function(){
		if($(this).hasClass('required')){
			$(this).find('label').prepend('<span style="color: red;">* </span>');
		}
	});
});
//--></script>

<script type="text/javascript"><!--
$(document).ready(function(){
	$('#shipping-address #input-country').material_select();
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
	$('select').material_select();
});
//--></script>