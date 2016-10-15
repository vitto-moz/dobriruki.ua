<div class="slider" id="slideshow<?php echo $module; ?>">
	<ul class="slides">
		<?php foreach ($banners as $banner){ ?>
			<?php if ($banner['link']){ ?>
				<li>
					<a href="<?php echo $banner['link']; ?>"><img class="waves-effect waves-block waves-light" src="<?php echo $banner['image']; ?>" title="<?php echo $banner['title']; ?>"></a>
				</li>
			<?php } else { ?>
				<li>
					<img class="waves-effect waves-block waves-light" src="<?php echo $banner['image']; ?>" title="<?php echo $banner['title']; ?>">
				</li>
			<?php } ?>
		<?php } ?>
	</ul>
</div>