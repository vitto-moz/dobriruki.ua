<form action="https://secure.bluepay.com/interfaces/bp10emu" method=POST>    
	<div id="payment">
		<span class="card-title"><?php echo $text_credit_card; ?></span>
		<?php if (!empty($existing_cards)) { ?>
			<div class="input-field">
				<p><?php echo $entry_card; ?></p>
				<fieldset class="border-none">
					<p>
						<input type="radio" name="new-existing" id="input-existing" value="existing" checked="checked"/>
						<label for="input-existing"><?php echo $entry_card_existing; ?></label>
					</p>
					<p>
						<input type="radio" name="new-existing" id="input-new" value="new" />
						<label for="input-new"><?php echo $entry_card_new; ?></label>
					</p>
				</fieldset>
			</div>
			<div id="card-existing">                
				<div class="input-field required">
						<select name="RRNO">
							<?php foreach ($existing_cards as $existing_card) { ?>
								<option value="<?php echo $existing_card['token']; ?>"><?php echo $text_card_type . ' ' . $existing_card['type']; ?>, <?php echo $text_card_digits . ' ' . $existing_card['digits']; ?>, <?php echo $text_card_expiry . ' ' . $existing_card['expiry']; ?></option>   
							<?php } ?>
						</select>
					 <label><?php echo $entry_cc_choice; ?></label>
				</div>
				<div class="input-field required">
					<input type="text" name="CVCCVV2" value="" id="input-cc-cvv2" />
					<label for="input-cc-cvv2"><?php echo $entry_cc_cvv2; ?></label>
				</div>
			</div>
			<div  style="display: none" id="card-new">
		<?php } else { ?>
			<div id="card-new">
		<?php } ?>                
                <div class="input-field required">
					<input type="text" name="CC_NUM" value="" id="input-cc-number" />
					<label for="input-cc-number"><?php echo $entry_cc_number; ?></label>
				</div>
				<div class="input-field required">
					<select name="CC_EXPIRES_MONTH">
						<?php foreach ($months as $month) { ?>
							<option value="<?php echo $month['value']; ?>"><?php echo $month['text']; ?></option>
						<?php } ?>
						<label><?php echo $entry_cc_expire_date; ?></label>
					</select>
				</div>
				<div class="input-field">
					<select name="CC_EXPIRES_YEAR">
						<?php foreach ($year_expire as $year) { ?>
							<option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
						<?php } ?>
					</select>
					<label><?php echo $entry_cc_expire_date; ?></label>
				</div>
				<div class="inpit-field required">
					<input type="text" name="CVCCVV2" value="" id="input-cc-cvv2" />
					<label for="input-cc-cvv2"><?php echo $entry_cc_cvv2; ?></label>
				</div>
				<?php if ($bluepay_redirect_card) { ?>
					<div class="input-field">
						<input id="input-cc-save" type="checkbox" name="CreateToken" value="1" />
						<label for="input-cc-save"><?php echo $entry_card_save; ?></label>
					</div>
				<?php } ?>                
			</div>
			<div class="input-field">
				<input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn element-theme" />
			</div>
	</div>
</form>
<script type="text/javascript"><!--
    $(document).ready(function() {
<?php if (!empty($existing_cards)) { ?>
			$('#card-new input').prop('disabled', true);
			$('#card-new input').prop('disabled', true);
			$('#card-new select').prop('disabled', true);
<?php } ?>
	});
//--></script>
<script type="text/javascript"><!--
	$('input[name=\'new-existing\']').on('change', function() {
		if (this.value === 'existing') {
			$('#card-existing').show();
			$('#card-new').hide();
			$('#card-new input').prop('disabled', true);
			$('#card-new select').prop('disabled', true);
			$('#card-existing select').prop('disabled', false);
			$('#input-cc-cvv2').prop('disabled', false);
		} else {
			$('#card-existing').hide();
			$('#card-new').show();
			$('#card-new input').prop('disabled', false);
			$('#card-new select').prop('disabled', false);
			$('#card-existing select').prop('disabled', true);
			$('#card-existing input').prop('disabled', true);
		}
	});
//--></script>
<script type="text/javascript">
	$('#button-confirm').bind('click', function() {
		$.ajax({
			url: 'index.php?route=payment/bluepay_redirect/send',
			type: 'post',
			data: $('#card-new :input[type=\'text\']:enabled, #card-new select:enabled, #card-new :input[type=\'checkbox\']:checked:enabled, #payment select:enabled, #card-existing :input:enabled'),
			dataType: 'json',
			cache: false,
			beforeSend: function() {
				$('#nav-preloader').show();
			},
			complete: function() {
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
//</script>