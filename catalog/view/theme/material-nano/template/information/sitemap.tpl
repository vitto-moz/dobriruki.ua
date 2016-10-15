<?php echo $header; ?>
<main>
<div class="container">
	<div class="row">
		<div class="col s12 m12 l12">
			<div class="card white">
				<div class="card-content">
					<span class="card-title"><?php echo $heading_title; ?></span>
					<p>
						<div class="collection">
							<?php foreach ($categories as $category_1) { ?>
								<a href="<?php echo $category_1['href']; ?>" class="collection-item">&bull; <?php echo $category_1['name']; ?></a>
									<?php if ($category_1['children']) { ?>
										<?php foreach ($category_1['children'] as $category_2) { ?>
											<a href="<?php echo $category_2['href']; ?>" class="collection-item">&emsp;<?php echo $category_2['name']; ?></a>
												<?php if ($category_2['children']) { ?>
													<?php foreach ($category_2['children'] as $category_3) { ?>
														<a href="<?php echo $category_3['href']; ?>" class="collection-item">&emsp;&emsp;<?php echo $category_3['name']; ?></a>
													<?php } ?>
												<?php } ?>
										<?php } ?>
									<?php } ?>
							<?php } ?>
							<a href="<?php echo $account; ?>" class="collection-item">&bull; <?php echo $text_account; ?>
							<a href="<?php echo $edit; ?>" class="collection-item">&emsp; <?php echo $text_edit; ?></a>
							<a href="<?php echo $password; ?>" class="collection-item">&emsp; <?php echo $text_password; ?></a>
							<a href="<?php echo $address; ?>" class="collection-item">&emsp; <?php echo $text_address; ?></a>
							<a href="<?php echo $history; ?>" class="collection-item">&emsp; <?php echo $text_history; ?></a>
							<a href="<?php echo $cart; ?>" class="collection-item">&emsp; <?php echo $text_cart; ?></a>
							<a href="<?php echo $checkout; ?>" class="collection-item">&emsp; <?php echo $text_checkout; ?></a>
							<a href="<?php echo $search; ?>" class="collection-item">&emsp; <?php echo $text_search; ?></a>
						</div>
					</p>
					<span class="card-title"><?php echo $text_information; ?></span>
					<p>
						<div class="collection">
              <?php foreach ($informations as $information) { ?>
								<a href="<?php echo $information['href']; ?>" class="collection-item"><?php echo $information['title']; ?></a>
							<?php } ?>
							<a href="<?php echo $contact; ?>" class="collection-item"><?php echo $text_contact; ?></a>
						</div>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
</main>
<?php echo $footer; ?>
