<?php echo $header; ?>
<main>
<div class="container">
<div class="row">
	<div class="col s12 m12 l12">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		<div class="card">
			<div class="card-content">
				<span class="card-title"><?php echo $text_edit_address; ?></span>
				<p>
					<div class="input-field required">
								<input type="text" name="firstname" id="input-firstname" value="<?php echo $firstname; ?>" />
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
							<div class="input-field" id="tagInputZone"></div>
								<?php if ($error_zone) { ?>
									<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_zone; ?></span>', toastTime)</script>
              	<?php } ?>
						<div class="input-field">
							<p><?php echo $entry_default; ?></p>
							<?php if ($default) { ?>
								<input type="radio" name="default" id="yes_default" value="1" checked="checked" />
								<label for="yes_default"><?php echo $text_yes; ?></label>
								<input type="radio" name="default" id="no_default" value="0" />
								<label for="no_default"><?php echo $text_no; ?></label>
              <?php } else { ?>
								<input type="radio" name="default" id="yes_default" value="1" />
								<label for="yes_default"><?php echo $text_yes; ?></label>
								<input type="radio" name="default" id="no_default" value="0" checked="checked" />
								<label for="no_default"><?php echo $text_no; ?></label>
              <?php } ?>
						</div>
				</p>
			</div>
			<div class="card-action">
				<a href="<?php echo $back; ?>"><?php echo $button_back; ?></a>
				<a class="submit-link clickable"><?php echo $button_continue; ?></a>
			</div>
		</div>
		</form>
	</div>
</div>
</div>
</main>

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
				Materialize.toast('<span class="text-select-none">' + thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText + '</span>', toastTime);
			}
		});
	});
});
$('#input-country').trigger('change');
//--></script>
<?php echo $footer; ?>
