<?php echo $header; ?>
<main>
<div class="container">
	<?php if ($error_warning) { ?>
  	<script type="text/javascript">
			Materialize.toast('<span class="text-select-none"><i class="left material-icons">error</i><?php echo $error_warning; ?></span>', toastTime);
		</script>
  <?php } ?>
<div class="row">
	<div class="col s12 m12 l12">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		<div class="card white">
			<div class="card-content">
				<span class="card-title"><?php echo $heading_title; ?></span>
					<p class="text-select-none"><?php echo $text_account_already; ?></p>
					<p>
							<span class="card-title"><small><?php echo $text_your_details; ?></small></span>
							<div class="input-field" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
								<p><?php echo $entry_customer_group; ?></p>
								<fieldset class="border-none">
									<?php foreach ($customer_groups as $customer_group) { ?>
										<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
											<p>
												<input type="radio" name="customer_group_id" id="customer_group_id_<?php echo $customer_group['customer_group_id']; ?>" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
												<label for="customer_group_id_<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
											</p>
										<?php } else { ?>
											<p>
												<input type="radio" name="customer_group_id" id="customer_group_id_<?php echo $customer_group['customer_group_id']; ?>" value="<?php echo $customer_group['customer_group_id']; ?>" />
												<label for="customer_group_id_<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
											</p>
										<?php } ?>
									<?php } ?>
								</fieldset>
							</div>
							<div class="input-field required">
								<input type="text" name="firstname" id="input-firstname" value="<?php echo $firstname; ?>" class="required" />
								<label for="input-firstname"><?php echo $entry_firstname; ?></label>
								<?php if ($error_firstname) { ?>
              		<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_firstname; ?></span>', toastTime)</script>
              	<?php } ?>
							</div>
							<div class="input-field required">
								<input type="text" name="lastname" id="input-lastname" value="<?php echo $lastname; ?>" />
								<label for="input-lastname"><?php echo $entry_lastname; ?></label>
								<?php if ($error_lastname) { ?>
              		<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_lastname; ?></span>', toastTime)</script>
              	<?php } ?>
							</div>
							<div class="input-field required">
								<input type="email" name="email" id="input-email" value="<?php echo $email; ?>" />
								<label for="input-email"><?php echo $entry_email; ?></label>
								<?php if ($error_email) { ?>
              		<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_email; ?></span>', toastTime)</script>
								<?php } ?>
							</div>
							<div class="input-field required">
								<input type="text" name="telephone" id="input-telephone" value="<?php echo $telephone; ?>" />
              	<label for="input-telephone"><?php echo $entry_telephone; ?></label>
								<?php if ($error_telephone) { ?>
              		<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_telephone; ?></span>', toastTime)</script>
              	<?php } ?>
							</div>
							<span class="card-title"><small><?php echo $text_your_address; ?></small></span>
							<div class="input-field">
								<input type="text" name="company" id="input-company" value="<?php echo $company; ?>" />
								<label for="input-company"><?php echo $entry_company; ?></label>
							</div>
							<div class="input-field required">
								<input type="text" name="address_1" value="<?php echo $address_1; ?>" id="input-address-1" />
								<label for="input-address-1"><?php echo $entry_address_1; ?></label>
								<?php if ($error_address_1) { ?>
              		<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_address_1; ?></span>', toastTime)</script>
             		<?php } ?>
							</div>
							<div class="input-field">
								<input type="text" name="address_2" id="input-address-2" value="<?php echo $address_2; ?>" />
								<label for="input-address-2"><?php echo $entry_address_2; ?></label>
							</div>
							<div class="input-field required">
								<input type="text" name="city" value="<?php echo $city; ?>" id="input-city" />
								<label for="input-city"><?php echo $entry_city; ?></label>
								<?php if ($error_city) { ?>
									<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_city; ?></span>', toastTime)</script>
								<?php } ?>
							</div>
							<div class="input-field required">
								<input type="text" name="postcode" id="input-postcode" value="<?php echo $postcode; ?>" />
								<label for="input-postcode"><?php echo $entry_postcode; ?></label>
								<?php if ($error_postcode) { ?>
									<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_postcode; ?></span>', toastTime)</script>
								<?php } ?>
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
								<?php if ($error_country) { ?>
									<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_country; ?></span>', toastTime)</script>
								<?php } ?>
							</div>
							<div class="input-field required" id="tagInputZone"></div>
								<?php if ($error_zone) { ?>
									<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_zone; ?></span>', toastTime)</script>
								<?php } ?>
								<span class="card-title"><small><?php echo $text_your_password; ?></small></span>
								<div class="input-field required">
									<input type="password" name="password" id="input-password" value="<?php echo $password; ?>" />
									<label for="input-password"><?php echo $entry_password; ?></label>
									<?php if ($error_password) { ?>
										<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_password; ?></span>', toastTime)</script>
									<?php } ?>
								</div>
								<div class="input-field required">
									<input type="password" name="confirm" id="input-confirm" value="<?php echo $confirm; ?>" />
									<label for="input-confirm"><?php echo $entry_confirm; ?></label>
									<?php if ($error_confirm) { ?>
										<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_confirm; ?></span>', toastTime)</script>
									<?php } ?>
								</div>
								<span class="card-title"><small><?php echo $text_newsletter; ?></small></span>
								<div class="row">
									<div class="input-field col s12 m12 l12">
										<?php if ($newsletter) { ?>
												<span>
												<p><?php echo $entry_newsletter; ?></p>
												<input type="radio" name="newsletter" value="1" id="newsletter_yes" checked="checked" />
												<label for="newsletter_yes"><?php echo $text_yes; ?></label>
												<input type="radio" name="newsletter" value="0" id="newsletter_no" />
												<label for="newsletter_no"><?php echo $text_no; ?></label>
												</span>
											<?php } else { ?>
												<span>
												<p><?php echo $entry_newsletter; ?></p>
												<input type="radio" name="newsletter" value="1"  id="newsletter_yes" />
												<label for="newsletter_yes"><?php echo $text_yes; ?></label>
												<input type="radio" name="newsletter" value="0" id="newsletter_no" checked="checked" />
												<label for="newsletter_no"><?php echo $text_no; ?></label>
												</span>
											<?php } ?>
										
									</div>
								</div>
						<?php if ($text_agree) { ?>
							<?php if ($agree) { ?>
								<input type="checkbox" id="test5" name="agree" value="1" checked="checked" />
								<label for="test5"><span class="text-select-none"><?php echo $text_agree; ?></span></label>
							<?php } else { ?>
								<input type="checkbox" id="test5" name="agree" value="1" />
								<label for="test5"><span class="text-select-none"><?php echo $text_agree; ?></span></label>
							<?php } ?>
						<?php } ?>
					</p>
			</div>
			<div class="card-action">
				<a class="submit-link clickable"><?php echo $button_continue; ?></a>
 			</div>
		</div>
		</form>
	</div>
</div>
</div>
</main>

<script type="text/javascript"><!--
$('input name=\"customer_group_id\"').on('change', function() {
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

$('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script>
<script type="text/javascript"><!--
$(document).ready(function(){
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
//--></script>
<?php echo $footer; ?>
