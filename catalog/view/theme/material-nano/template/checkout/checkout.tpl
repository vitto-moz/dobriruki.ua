<?php echo $header; ?>
<main>
<div class="container">
<?php if ($error_warning) { ?>
	<script type="text/javascript">Materialize.toast('<span class="text-select-none"><i class="left material-icons">warning</i><?php echo $error_warning; ?></span>', toastTime)</script>
<?php } ?>
<div class="row">
	<h5 class="centered" id="now-step"></h5>
	<div class="col s12 m12 l12" id="checkout-steps">
		<div class="chip" id="step-checkout-option" content="0"><?php echo $text_checkout_option; ?></div>
		<?php if (!$logged && $account != 'guest') { ?>
			<div class="chip" id="step-payment-address" content="0"><?php echo $text_checkout_account; ?></div>
		<?php } else { ?>
			<div class="chip" id="step-payment-address" content="0"><?php echo $text_checkout_payment_address; ?></div>
		<?php } ?>
		<?php if ($shipping_required) { ?>
			<div class="chip" id="step-shipping-address" content="0"><?php echo $text_checkout_shipping_address; ?></div>
			<div class="chip" id="step-shipping-method" content="0"><?php echo $text_checkout_shipping_method; ?></div>
		<?php } ?>
		<div class="chip" id="step-payment-method" content="0"><?php echo $text_checkout_payment_method; ?></div>
		<div class="chip" id="step-checkout-confirm" content="0"><?php echo $text_checkout_confirm; ?></div>
	</div>
	
	<div class="col s12 m12 l12 display-none hiding-content" id="checkout-option"></div>
	<?php if (!$logged && $account != 'guest') { ?>
		<div class="col s12 m12 l12 display-none hiding-content" id="payment-address"></div>
	<?php } else { ?>
		<div class="col s12 m12 l12 display-none hiding-content" id="payment-address"></div>
	<?php } ?>
	<?php if ($shipping_required) { ?>
		<div class="col s12 m12 l12 display-none hiding-content" id="shipping-address"></div>
		<div class="col s12 m12 l12 display-none hiding-content" id="shipping-method"></div>
	<?php } ?>
	<div class="col s12 m12 l12 display-none hiding-content" id="payment-method"></div>
	<div class="col s12 m12 l12 display-none hiding-content" id="checkout-confirm"></div>
</div>
</div>
</main>

<script type="text/javascript"><!--
$(document).ready(function(){
	$('#step-checkout-option').on('click', function(){
		if($(this).attr('content') == '1'){
			$('.hiding-content').each(function(){
				$(this).hide();
			});
			$('#checkout-option').show();
		}
	});
	$('#step-payment-address').on('click', function(){
		if($(this).attr('content') == '1'){
			$('.hiding-content').each(function(){
				$(this).hide();
			});
			$('#payment-address').show();
		}
	});
	<?php if ($shipping_required) { ?>
	$('#step-shipping-address').on('click', function(){
		if($(this).attr('content') == '1'){
			$('.hiding-content').each(function(){
				$(this).hide();
			});
			$('#shipping-address').show();
		}
	});
	$('#step-shipping-method').on('click', function(){
		if($(this).attr('content') == '1'){
			$('.hiding-content').each(function(){
				$(this).hide();
			});
			$('#shipping-method').show();
		}
	});
	<?php } ?>
	$('#step-payment-method').on('click', function(){
		if($(this).attr('content') == '1'){
			$('.hiding-content').each(function(){
				$(this).hide();
			});
			$('#payment-method').show();
		}
	});
	$('#step-checkout-confirm').on('click', function(){
		if($(this).attr('content') == '1'){
			$('.hiding-content').each(function(){
				$(this).hide();
			});
			$('#checkout-confirm').show();
		}
	});
});


<?php if (!$logged) { ?>
$(document).ready(function() {
    $.ajax({
        url: 'index.php?route=checkout/login',
        dataType: 'html',
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},
        success: function(html) {
			$('#checkout-option').html(html);
			$('.hiding-content').each(function(){
				$(this).hide();
			});
			$('#checkout-option').show();
			
			$('.chip').each(function(){
				$(this).removeClass('grey');
			});
			$('#step-checkout-option').addClass('grey');
			$('#step-checkout-option').attr('content', '1');
			$('#now-step').html('<?php echo $text_checkout_option; ?>');
			$('html, body').animate({scrollTop: 0}, 'slow');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
        }
    });
});
<?php } else { ?>
$(document).ready(function() {
    $.ajax({
        url: 'index.php?route=checkout/payment_address',
        dataType: 'html',
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},
        success: function(html) {
            $('#payment-address').html(html);
			$('.hiding-content').each(function(){
				$(this).hide();
			});
			$('#payment-address').show();
			
			$('.chip').each(function(){
				$(this).removeClass('grey');
			});
			$('#step-payment-address').addClass('grey');
			$('#step-payment-address').attr('content', '1');
			$('#now-step').html('<?php echo $text_checkout_payment_address; ?>');
			$('html, body').animate({scrollTop: 0}, 'slow');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
        }
    });
});
<?php } ?>

// Checkout
$(document).delegate('#button-account', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/' + $('input[name=\'account\']:checked').val(),
        dataType: 'html',
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},
        success: function(html) {
            $('#payment-address').html(html);
			$('.hiding-content').each(function(){
				$(this).hide();
			});
			$('#payment-address').show();

			if ($('input[name=\'account\']:checked').val() == 'register') {
				$('.chip').each(function(){
					$(this).removeClass('grey');
				});
				$('#step-payment-address').html('<?php echo $text_checkout_account; ?>');
				$('#step-payment-address').addClass('grey');
				$('#step-payment-address').attr('content', '1');
				$('#now-step').html('<?php echo $text_checkout_account; ?>');
				$('html, body').animate({scrollTop: 0}, 'slow');
			} else {
				$('.chip').each(function(){
					$(this).removeClass('grey');
				});
				$('#step-payment-address').html('<?php echo $text_checkout_payment_address; ?>');
				$('#step-payment-address').addClass('grey');
				$('#step-payment-address').attr('content', '1');
				$('#now-step').html('<?php echo $text_checkout_payment_address; ?>');
				$('html, body').animate({scrollTop: 0}, 'slow');
			}
        },
        error: function(xhr, ajaxOptions, thrownError) {
            Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
        }
    });
});

// Login
$(document).delegate('#button-login', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/login/save',
        type: 'post',
        data: $('#checkout-option #input-email, #checkout-option #input-password'),
        dataType: 'json',
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
				Materialize.toast('<span class="text-select-none">' + json['error']['warning'] + '</span>', toastTime);
		   }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
        }
    });
});

// Register
$(document).delegate('#button-register', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/register/save',
        type: 'post',
        data: $('#shipping-method input[type=\'text\'], #card-register input[type=\'date\'], #card-register input[type=\'datetime-local\'], #card-register input[type=\'time\'], #card-register input[type=\'password\'], #card-register input[type=\'hidden\'], #card-register input[type=\'checkbox\']:checked, #card-register input[type=\'radio\']:checked, #card-register textarea, #card-register select'),
        dataType: 'json',
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    Materialize.toast('<span class="text-select-none">' + json['error']['warning'] + '</span>', toastTime);
                }
				for (i in json['error']) {
					Materialize.toast('<span class="text-select-none">' + json['error'][i] + '</span>', toastTime);
				}
            } else {
                <?php if ($shipping_required) { ?>
                var shipping_address = $('#card-register input[name=\'shipping_address\']:checked').prop('value');

                if (shipping_address) {
                    $.ajax({
                        url: 'index.php?route=checkout/shipping_method',
                        dataType: 'html',
						beforeSend: function(){
							$('#nav-preloader').show();
						},
						complete: function(){
							$('#nav-preloader').hide();
						},
                        success: function(html) {
							// Add the shipping address
                            $.ajax({
                                url: 'index.php?route=checkout/shipping_address',
                                dataType: 'html',
								beforeSend: function(){
									$('#nav-preloader').show();
								},
								complete: function(){
									$('#nav-preloader').hide();
								},
                                success: function(html) {
                                    $('#shipping-address').html(html);
									$('#step-shipping-address').html('<?php echo $text_checkout_shipping_address; ?>');
                                },
                                error: function(xhr, ajaxOptions, thrownError) {
                                    Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                                }
                            });

							$('#shipping-method').html(html);
							$('.hiding-content').each(function(){
								$(this).hide();
							});
							$('#shipping-method').show();
							
							$('#step-shipping-method').html('<?php echo $text_checkout_shipping_method; ?>');
							$('.chip').each(function(){
								$(this).removeClass('grey');
							});
							$('#step-shipping-method').addClass('grey');
							$('#step-shipping-method').attr('content', '1');
							$('#now-step').html('<?php echo $text_checkout_shipping_method; ?>');
							$('html, body').animate({scrollTop: 0}, 'slow');
							
							$('#step-shipping-method').html('<?php echo $text_checkout_shipping_method; ?>');
							$('#step-payment-method').html('<?php echo $text_checkout_payment_method; ?>');
							$('#step-checkout-confirm').html('<?php echo $text_checkout_confirm; ?>');
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                        }
                    });
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/shipping_address',
                        dataType: 'html',
						beforeSend: function(){
							$('#nav-preloader').show();
						},
						complete: function(){
							$('#nav-preloader').hide();
						},
                        success: function(html) {
                            $('#shipping-address').html(html);
							$('.hiding-content').each(function(){
								$(this).hide();
							});
							$('#shipping-address').show();
							
							
							$('#step-shipping-address').html('<?php echo $text_checkout_shipping_address; ?>');
							$('.chip').each(function(){
								$(this).removeClass('grey');
							});
							$('#step-shipping-address').addClass('grey');
							$('#step-shipping-address').attr('content', '1');
							$('#now-step').html('<?php echo $text_checkout_shipping_address; ?>');
							$('html, body').animate({scrollTop: 0}, 'slow');

							$('#step-shipping-method').html('<?php echo $text_checkout_shipping_method; ?>');
							$('#step-payment-method').html('<?php echo $text_checkout_payment_method; ?>');
							$('#step-checkout-confirm').html('<?php echo $text_checkout_confirm; ?>');
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                        }
                    });
                }
                <?php } else { ?>
                $.ajax({
                    url: 'index.php?route=checkout/payment_method',
                    dataType: 'html',
					beforeSend: function(){
						$('#nav-preloader').show();
					},
					complete: function(){
						$('#nav-preloader').hide();
					},
                    success: function(html) {
                        $('#payment-method').html(html);
						$('.hiding-content').each(function(){
							$(this).hide();
						});
						
						$('#step-payment-method').html('<?php echo $text_checkout_payment_method; ?>');
						$('.chip').each(function(){
							$(this).removeClass('grey');
						});
						$('#step-payment-method').addClass('grey');
						$('#step-payment-method').attr('content', '1');
						$('#now-step').html('<?php echo $text_checkout_payment_method; ?>');
						$('html, body').animate({scrollTop: 0}, 'slow');
						
						$('#step-checkout-confirm').html('<?php echo $text_checkout_confirm; ?>');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                    }
                });
                <?php } ?>

                $.ajax({
                    url: 'index.php?route=checkout/payment_address',
                    dataType: 'html',
					beforeSend: function(){
						$('#nav-preloader').show();
					},
					complete: function(){
						$('#nav-preloader').hide();
					},
                    success: function(html) {
                        $('#payment-address').html(html);
						$('.hiding-content').each(function(){
							$(this).hide();
						});
						
						$('#step-payment-address').html('<?php echo $text_checkout_payment_address; ?>');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                    }
                });
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
        }
    });
});

// Payment Address
$(document).delegate('#button-payment-address', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/payment_address/save',
        type: 'post',
        data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'date\'], #payment-address input[type=\'datetime-local\'], #payment-address input[type=\'time\'], #payment-address input[type=\'password\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address textarea, #payment-address select'),
        dataType: 'json',
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    Materialize.toast('<span class="text-select-none">' + json['error']['warning'] + '</span>', toastTime);
                }
				for (i in json['error']) {
					Materialize.toast('<span class="text-select-none">' + json['error'][i] + '</span>', toastTime);
				}
            } else {
                <?php if ($shipping_required) { ?>
                $.ajax({
                    url: 'index.php?route=checkout/shipping_address',
                    dataType: 'html',
					beforeSend: function(){
						$('#nav-preloader').show();
					},
					complete: function(){
						$('#nav-preloader').hide();
					},
                    success: function(html) {
                        $('#shipping-address').html(html);
						$('.hiding-content').each(function(){
							$(this).hide();
						});
						$('#shipping-address').show();
						
						$('#step-shipping-address').html('<?php echo $text_checkout_shipping_address; ?>');
						$('.chip').each(function(){
							$(this).removeClass('grey');
						});
						$('#step-shipping-address').addClass('grey');
						$('#step-shipping-address').attr('content', '1');
						$('#now-step').html('<?php echo $text_checkout_shipping_address; ?>');
						$('html, body').animate({scrollTop: 0}, 'slow');

						$('#step-shipping-method').html('<?php echo $text_checkout_shipping_method; ?>');
						$('#step-payment-method').html('<?php echo $text_checkout_payment_method; ?>');
						$('#step-checkout-confirm').html('<?php echo $text_checkout_confirm; ?>');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                    }
                });
                <?php } else { ?>
                $.ajax({
                    url: 'index.php?route=checkout/payment_method',
                    dataType: 'html',
					beforeSend: function(){
						$('#nav-preloader').show();
					},
					complete: function(){
						$('#nav-preloader').hide();
					},
                    success: function(html) {
                        $('#payment-method').html(html);
						$('.hiding-content').each(function(){
							$(this).hide();
						});
						$('#payment-method').show();
						
						$('#step-payment-method').html('<?php echo $text_checkout_payment_method; ?>');
						$('.chip').each(function(){
							$(this).removeClass('grey');
						});
						$('#step-payment-method').addClass('grey');
						$('#step-payment-method').attr('content', '1');
						$('#now-step').html('<?php echo $text_checkout_payment_method; ?>');
						$('html, body').animate({scrollTop: 0}, 'slow');
						
						$('#step-checkout-confirm').html('<?php echo $text_checkout_confirm; ?>');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                    }
                });
                <?php } ?>

                $.ajax({
                    url: 'index.php?route=checkout/payment_address',
                    dataType: 'html',
					beforeSend: function(){
						$('#nav-preloader').show();
					},
					complete: function(){
						$('#nav-preloader').hide();
					},
                    success: function(html) {
                        $('#payment-address').html(html);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                    }
                });
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
        }
    });
});

// Shipping Address
$(document).delegate('#button-shipping-address', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/shipping_address/save',
        type: 'post',
        data: $('#shipping-address input[type=\'text\'], #shipping-address input[type=\'date\'], #shipping-address input[type=\'datetime-local\'], #shipping-address input[type=\'time\'], #shipping-address input[type=\'password\'], #shipping-address input[type=\'checkbox\']:checked, #shipping-address input[type=\'radio\']:checked, #shipping-address textarea, #shipping-address select'),
        dataType: 'json',
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    Materialize.toast('<span class="text-select-none">' + json['error']['warning'] + '</span>', toastTime);
                }
				for (i in json['error']) {
					Materialize.toast('<span class="text-select-none">' + json['error'][i] + '</span>', toastTime);
				}
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/shipping_method',
                    dataType: 'html',
					beforeSend: function(){
						$('#nav-preloader').show();
					},
					complete: function(){
						$('#nav-preloader').hide();
					},
                    success: function(html) {
                        $('#shipping-method').html(html);
						$('.hiding-content').each(function(){
							$(this).hide();
						});
						$('#shipping-method').show();
												
						$('#step-shipping-method').html('<?php echo $text_checkout_shipping_method; ?>');
						$('.chip').each(function(){
							$(this).removeClass('grey');
						});
						$('#step-shipping-method').addClass('grey');
						$('#step-shipping-method').attr('content', '1');
						$('#now-step').html('<?php echo $text_checkout_shipping_method; ?>');
						$('html, body').animate({scrollTop: 0}, 'slow');

						$('#step-payment-method').html('<?php echo $text_checkout_payment_method; ?>');
						$('#step-checkout-confirm').html('<?php echo $text_checkout_confirm; ?>');

                        $.ajax({
                            url: 'index.php?route=checkout/shipping_address',
                            dataType: 'html',
							beforeSend: function(){
								$('#nav-preloader').show();
							},
							complete: function(){
								$('#nav-preloader').hide();
							},
                            success: function(html) {
                                $('#shipping-address').html(html);
                            },
                            error: function(xhr, ajaxOptions, thrownError) {
                                Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                            }
                        });
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                    }
                });

                $.ajax({
                    url: 'index.php?route=checkout/payment_address',
                    dataType: 'html',
					beforeSend: function(){
						$('#nav-preloader').show();
					},
					complete: function(){
						$('#nav-preloader').hide();
					},
                    success: function(html) {
                        $('#payment-address').html(html);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                    }
                });
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
        }
    });
});

// Guest
$(document).delegate('#button-guest', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/guest/save',
        type: 'post',
        data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'date\'], #payment-address input[type=\'datetime-local\'], #payment-address input[type=\'time\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address textarea, #payment-address select'),
        dataType: 'json',
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    Materialize.toast('<span class="text-select-none">' + json['error']['warning'] + '</span>', toastTime);
                }
				for (i in json['error']) {
					 Materialize.toast('<span class="text-select-none">' + json['error'][i] + '</span>', toastTime);
				}
            } else {
                <?php if ($shipping_required) { ?>
                var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').prop('value');

                if (shipping_address) {
                    $.ajax({
                        url: 'index.php?route=checkout/shipping_method',
                        dataType: 'html',
						beforeSend: function(){
							$('#nav-preloader').show();
						},
						complete: function(){
							$('#nav-preloader').hide();
						},
                        success: function(html) {
							// Add the shipping address
                            $.ajax({
                                url: 'index.php?route=checkout/guest_shipping',
                                dataType: 'html',
								beforeSend: function(){
									$('#nav-preloader').show();
								},
								complete: function(){
									$('#nav-preloader').hide();
								},
                                success: function(html) {
                                    $('#shipping-address').html(html);
									$('#step-shipping-address').html('<?php echo $text_checkout_shipping_address; ?>');
                                },
                                error: function(xhr, ajaxOptions, thrownError) {
                                    Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                                }
                            });

						    $('#shipping-method').html(html);
							$('.hiding-content').each(function(){
								$(this).hide();
							});
							$('#shipping-method').show();
							
							$('#step-shipping-method').html('<?php echo $text_checkout_shipping_method; ?>');
							$('.chip').each(function(){
								$(this).removeClass('grey');
							});
							$('#step-shipping-method').addClass('grey');
							$('#step-shipping-method').attr('content', '1');
							$('#now-step').html('<?php echo $text_checkout_shipping_method; ?>');
							$('html, body').animate({scrollTop: 0}, 'slow');

							$('#step-payment-method').html('<?php echo $text_checkout_payment_method; ?>');
							$('#step-checkout-confirm').html('<?php echo $text_checkout_confirm; ?>');
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                        }
                    });
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/guest_shipping',
                        dataType: 'html',
						beforeSend: function(){
							$('#nav-preloader').show();
						},
						complete: function(){
							$('#nav-preloader').hide();
						},
                        success: function(html) {
                            $('#shipping-address').html(html);
							$('.hiding-content').each(function(){
								$(this).hide();
							});
							$('#shipping-address').show();
							
							$('#step-shipping-address').html('<?php echo $text_checkout_shipping_address; ?>');
							$('.chip').each(function(){
								$(this).removeClass('grey');
							});
							$('#step-shipping-address').addClass('grey');
							$('#step-shipping-address').attr('content', '1');
							$('#now-step').html('<?php echo $text_checkout_shipping_address; ?>');
							$('html, body').animate({scrollTop: 0}, 'slow');

							$('#step-shipping-method').html('<?php echo $text_checkout_shipping_method; ?>');
							$('#step-payment-method').html('<?php echo $text_checkout_payment_method; ?>');
							$('#step-checkout-confirm').html('<?php echo $text_checkout_confirm; ?>');
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                        }
                    });
                }
                <?php } else { ?>
                $.ajax({
                    url: 'index.php?route=checkout/payment_method',
                    dataType: 'html',
					beforeSend: function(){
						$('#nav-preloader').show();
					},
					complete: function(){
						$('#nav-preloader').hide();
					},
                    success: function(html) {
                        $('#payment-method').html(html);
						$('.hiding-content').each(function(){
							$(this).hide();
						});
						$('#payment-method').show();
						
						$('#step-payment-method').html('<?php echo $text_checkout_payment_method; ?>');
						$('.chip').each(function(){
							$(this).removeClass('grey');
						});
						$('#step-payment-method').addClass('grey');
						$('#step-payment-method').attr('content', '1');
						$('#now-step').html('<?php echo $text_checkout_payment_method; ?>');
						$('html, body').animate({scrollTop: 0}, 'slow');
						
						$('#step-checkout-confirm').html('<?php echo $text_checkout_confirm; ?>');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                    }
                });
                <?php } ?>
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
        }
    });
});

// Guest Shipping
$(document).delegate('#button-guest-shipping', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/guest_shipping/save',
        type: 'post',
        data: $('#shipping-address input[type=\'text\'], #shipping-address input[type=\'date\'], #shipping-address input[type=\'datetime-local\'], #shipping-address input[type=\'time\'], #shipping-address input[type=\'password\'], #shipping-address input[type=\'checkbox\']:checked, #shipping-address input[type=\'radio\']:checked, #shipping-address textarea, #shipping-address select'),
        dataType: 'json',
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    Materialize.toast('<span class="text-select-none">' + json['error']['warning'] + '</span>', toastTime);
                }
				for (i in json['error']) {
					Materialize.toast('<span class="text-select-none">' + json['error'][i] + '</span>', toastTime);
				}
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/shipping_method',
                    dataType: 'html',
					beforeSend: function(){
						$('#nav-preloader').show();
					},
					complete: function(){
						$('#nav-preloader').hide();
					},
                    success: function(html) {
                        $('#shipping-method').html(html);
						$('.hiding-content').each(function(){
							$(this).hide();
						});
						$('#shipping-method').show();
						
						$('#step-shipping-method').html('<?php echo $text_checkout_shipping_method; ?>');
						$('.chip').each(function(){
							$(this).removeClass('grey');
						});
						$('#step-shipping-method').addClass('grey');
						$('#step-shipping-method').attr('content', '1');
						$('#now-step').html('<?php echo $text_checkout_shipping_method; ?>');
						$('html, body').animate({scrollTop: 0}, 'slow');

						$('#step-payment-method').html('<?php echo $text_checkout_payment_method; ?>');
						$('#step-checkout-confirm').html('<?php echo $text_checkout_confirm; ?>');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                    }
                });
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
        }
    });
});

//Shipping method
$(document).delegate('#button-shipping-method', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/shipping_method/save',
        type: 'post',
        data: $('#shipping-method input[type=\'radio\']:checked, #shipping-method textarea'),
        dataType: 'json',
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {             
                if (json['error']['warning']) {
                    Materialize.toast('<span class="text-select-none">' + json['error']['warning'] + '</span>', toastTime);
                }
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/payment_method',
                    dataType: 'html',
					beforeSend: function(){
						$('#nav-preloader').show();
					},
					complete: function(){
						$('#nav-preloader').hide();
					},
                    success: function(html) {
                        $('#payment-method').html(html);
						$('.hiding-content').each(function(){
							$(this).hide();
						});
						$('#payment-method').show();
						
						$('#step-payment-method').html('<?php echo $text_checkout_payment_method; ?>');
						$('.chip').each(function(){
							$(this).removeClass('grey');
						});
						$('#step-payment-method').addClass('grey');
						$('#step-payment-method').attr('content', '1');
						$('#now-step').html('<?php echo $text_checkout_payment_method; ?>');
						$('html, body').animate({scrollTop: 0}, 'slow');

						$('#step-checkout-confirm').html('<?php echo $text_checkout_confirm; ?>');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                    }
                });
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
        }
    });
});

//Payment method
$(document).delegate('#button-payment-method', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/payment_method/save',
        type: 'post',
        data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'checkbox\']:checked, #payment-method textarea'),
        dataType: 'json',
		beforeSend: function(){
			$('#nav-preloader').show();
		},
		complete: function(){
			$('#nav-preloader').hide();
		},
        success: function(json) {
            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    Materialize.toast('<span class="text-select-none">' + json['error']['warning'] + '</span>', toastTime);
                }
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/confirm',
                    dataType: 'html',
					beforeSend: function(){
						$('#nav-preloader').show();
					},
					complete: function(){
						$('#nav-preloader').hide();
					},
                    success: function(html) {
                        $('#checkout-confirm').html(html);
						$('.hiding-content').each(function(){
							$(this).hide();
						});
						$('#checkout-confirm').show();
						
						$('#step-checkout-confirm').html('<?php echo $text_checkout_confirm; ?>');
						$('.chip').each(function(){
							$(this).removeClass('grey');
						});
						$('#step-checkout-confirm').addClass('grey');
						$('#step-checkout-confirm').attr('content', '1');
						$('#now-step').html('<?php echo $text_checkout_confirm; ?>');
						$('html, body').animate({scrollTop: 0}, 'slow');
					},
                    error: function(xhr, ajaxOptions, thrownError) {
                        Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
                    }
                });
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            Materialize.toast('<span class="text-select-none">' + thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText + '</span>', toastTime);
        }
    });
});
//--></script>
<?php echo $footer; ?>
