<div class="carousel" id="carousel<?php echo $module; ?>" style="max-height: 170px;">
		<?php foreach ($banners as $banner) { ?>
			<?php if ($banner['link']) { ?>
				<a class="carousel-item" href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
			<?php } else { ?>
				<a class="carousel-item"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
			<?php } ?>
		<?php } ?>
</div>

<script type="text/javascript"><!--
$(document).ready(function(){
      $('.carousel').carousel();
    });
--></script>
