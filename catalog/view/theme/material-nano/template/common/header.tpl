<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>

<script src="catalog/view/theme/material-nano/javascript/jquery-3.0.0.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/material-nano/javascript/materialize.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/material-nano/javascript/common.js" type="text/javascript"></script>

<link href="catalog/view/theme/material-nano/stylesheet/custom.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/material-nano/stylesheet/common.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/material-nano/stylesheet/materialize.min.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/material-nano/stylesheet/theme.css" rel="stylesheet" media="screen" />

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Inconsolata" rel="stylesheet" type="text/css">

<?php foreach ($styles as $style) { ?>
	<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php if (isset($icon)) { ?>
	<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
	<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>

<body class="<?php echo $class; ?>">
	<div class="navbar-fixed">
		<nav class="top-nav nav-theme">
			<a data-activates="slide-out-left" class="left button-collapse show-on-large clickable" id="slide-out-left-button" style="margin-left: 10px;"><i class="material-icons">menu</i></a>
			<a class="search-nav-button button-collapse right show-on-large clickable" style="margin-right: 10px;"><i class="material-icons">search</i></a>
			<ul id="slide-out-left" class="side-nav left" style="left: 0;">
				<li><a href="<?php echo $home; ?>"><i class="material-icons left">home</i><span class="nav-store-name"><?php echo $name; ?></span></a></li>
				<li><a href="<?php echo $contact; ?>"><i class="hidden material-icons left">phone</i><span class="nav-store-phone"><?php echo $telephone; ?></span></a></li>
				<li class="divider"></li>
				<?php if ($logged) { ?>
					<li><a class='hidden dropdown-button' data-activates='account'><i class="material-icons left">person</i><?php echo $text_account; ?></a></li>
				<?php } else { ?>
					<li><a class='hidden dropdown-button' data-activates='account'><i class="material-icons left">person_outline</i><?php echo $text_account; ?></a></li>
				<?php } ?>
				<ul id='account' class='hidden dropdown-content'>
					<?php if ($logged) { ?>
						<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
						<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
						<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
						<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
						<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
					<?php } else { ?>
						<li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
						<li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
					<?php } ?>
				</ul>
				<li class="divider"></li>
				<li><a href="<?php echo $wishlist; ?>"><i class="hidden material-icons left">favorite</i><span id="wishlist-total-menu"><?php echo $text_wishlist; ?></span></a></li>
				<li><a href="<?php echo $shopping_cart; ?>"><i class="hidden left material-icons">shopping_cart</i><?php echo $text_shopping_cart; ?></a></li>
				<li><a href="<?php echo $checkout; ?>"><i class="material-icons left">check_circle</i><?php echo $text_checkout; ?></a></li>
			</ul>
			<ul class="left">
				<li><a href="<?php echo $home; ?>" id="cart-name"><?php echo $name; ?></a></li>
			</ul>
			<ul class="hidden right hide-on-med-and-down">
				<li><a class='dropdown-button' data-activates='account-top'><?php echo $text_account; ?></a></li>
				<ul id='account-top' class='dropdown-content'>
					<?php if ($logged) { ?>
						<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
						<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
						<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
						<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
						<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
					<?php } else { ?>
						<li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
						<li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
					<?php } ?>
				</ul>
				<li><a href="<?php echo $shopping_cart; ?>" id="cart-total-nav"><?php echo $cart; ?></a></li>
				<li><a href="<?php echo $wishlist; ?>"><span id="wishlist-total-nav"><?php echo $text_wishlist; ?></span></a></li>
				<li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
			</ul>
			<div class="progress display-none" id="nav-preloader">
				<div class="indeterminate"></div>
			</div>
		</nav>
		<nav class="search-nav display-none">
			<?php echo $search; ?>
		</nav>
	</div>
	<header>
		<div class="container">
			<div id="content-cart-modal"></div>
			<div class="row" style="margin-top: 10px;">
				<div class="col s12 m12 l12 center">
					<?php if ($logo) { ?>
						<a href="<?php echo $home; ?>"><img class="responsive-img" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
					<?php } else { ?>
						<h4><a class="black-text" href="<?php echo $home; ?>"><?php echo $name; ?></a></h4>
					<?php } ?>
				</div>
				<div class="col s12 m12 l12 display-none centered" id="category-menu-desktop">
					<?php if ($categories) { ?>
									<?php foreach ($categories as $category) { ?>
										<?php if ($category['children']) { ?>
											<span class="dropdown-category">
												<a class="dropdown-button dropdown-button-category btn category-theme btn-margin" title="<?php echo $category['name']; ?>"><?php echo $category['name']; ?><i class="right material-icons">arrow_drop_down</i></a>
												<ul class="dropdown-content dropdown-content-category">
													<?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
														<?php foreach ($children as $child) { ?>
															<li><a class="default-link" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
														<?php } ?>
													<?php } ?>
													<li class="divider"></li>
													<li><a class="default-link" href="<?php echo $category['href']; ?>"><?php echo $text_all; ?> <?php echo $category['name']; ?></a></li>
												</ul>
											</span>
										<?php } else { ?>
											<a class="btn button-functions category-theme" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
										<?php } ?>
									<?php } ?>
					<?php } ?>
				</div>
				<div class="col s12 m12 l12 display-none" id="category-menu-mobile">
					<?php if ($categories) { ?>
						<ul class="collapsible" data-collapsible="accordion">
							<li>
								<div class="collapsible-header"><i class="material-icons">list</i><?php echo $text_category; ?><span class="search-category-button clickable"><i class="right material-icons">search</i></span></div>
								<div class="collapsible-body">
									<div class="collection">
										<?php foreach ($categories as $category) { ?>
											<?php if ($category['children']) { ?>
												<a class="collection-item" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
											<?php } else { ?>
												<a class="collection-item" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
											<?php } ?>
										<?php } ?>
									</div>
								</div>
							</li>
						</ul>
					<?php } ?>
				</div>
				<div class="col s12 m12 l12">
					<div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
						<a class="btn-floating btn-large button-collapse floating-button-theme" ><i class="material-icons large">settings</i></a>
						<ul>
							<li><a class="btn-floating red modal-trigger" href="#modal-phone"><i class="material-icons">phone</i></a></li>
							<?php if($language) { ?>
								<li><a class="btn-floating green modal-trigger" href="#modal-language"><i class="material-icons">language</i></a></li>
							<?php } ?>
							<?php if($currency) { ?>
								<li><a class="btn-floating blue modal-trigger" href="#modal-currency"><i class="material-icons">attach_money</i></a></li>
							<?php } ?>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="modal-phone" class="modal">
			<div class="modal-content">
				<h5><?php echo $name; ?></h5>
				<p><a class="default-link" href="<?php echo $contact; ?>"><?php echo $telephone; ?></a></p>
			</div>
		</div>
		<?php echo $language; ?>
		<?php echo $currency; ?>
	</header>