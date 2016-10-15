<?php if ($reviews) { ?>
	<?php foreach ($reviews as $review) { ?>
		<p><b><?php echo $review['author']; ?></b></p>
		<p><?php echo $review['date_added']; ?></p>
		<p>
		<?php if($review['rating'] == ''){
			echo '<span class="wrap-none text-select-none"><i class="material-icons">star_border</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i></span>';
		} else {
			switch ($review['rating']){
				case 1:
					echo '<span class="wrap-none text-select-none"><i class="material-icons">star</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i></span>';
					break;
				case 2:
					echo '<span class="wrap-none text-select-none"><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i></span>';
					break;
				case 3:
					echo '<span class="wrap-none text-select-none"><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star_border</i><i class="material-icons">star_border</i></span>';
					break;
				case 4:
					echo '<span class="wrap-none text-select-none"><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star_border</i></span>';
					break;
				case 5:
					echo '<span class="wrap-none text-select-none"><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i><i class="material-icons">star</i></span>';
					break;
			}
		} ?>
		</p>
		<p><?php echo $review['text']; ?></p>
		<hr />
	<?php } ?>
	<div class="centered"><?php echo $pagination; ?></div>
<?php } else { ?>
	<p><?php echo $text_no_reviews; ?></p>
<?php } ?>
