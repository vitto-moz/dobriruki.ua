<?php echo $header; ?>
<main>
<div class="container">
	<div class="row">
		<div class="col s12 m12 l12">
			<div class="card white">
				<div class="card-content">
					<span class="card-title"><?php echo $heading_title; ?></span>
					<p>
						<?php if ($categories) { ?>
							<p>
								<strong><?php echo $text_index; ?></strong>
								<?php foreach ($categories as $category) { ?>
									&nbsp;&nbsp;&nbsp;<a class="default-link" href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
								<?php } ?>
							</p>
 								<?php foreach ($categories as $category) { ?>
									<span class="card-title" id="<?php echo $category['name']; ?>"><small><?php echo $category['name']; ?></small></span>
											<div class="collection">
												<?php if ($category['manufacturer']) { ?>
													<?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>
														<?php foreach ($manufacturers as $manufacturer) { ?>
															<a href="<?php echo $manufacturer['href']; ?>" class="collection-item"><?php echo $manufacturer['name']; ?></a>
														<?php } ?>
													<?php } ?>
												<?php } ?>
											</div>
								<?php } ?>
						<?php } else { ?>
							<p><?php echo $text_empty; ?></p>
						<?php } ?>
					</p>
				</div>
				<div class="card-action">
					<a href="<?php echo $continue; ?>"><?php echo $button_continue; ?></a>
				</div>
			</div>
		</div>
	</div>
</div>
</main>
<?php echo $footer; ?>
