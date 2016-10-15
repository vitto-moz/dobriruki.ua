<footer class="page-footer nav-theme">
<div class="container">
	<div class="row">
		<?php if ($informations) { ?>
			<div class="col s12 m6 l4">
				<h5 class="white-text"><?php echo $text_information; ?></h5>
				<ul>
					<?php foreach ($informations as $information) { ?>
						<li><a class="white-text" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
					<?php } ?>
				</ul>
			</div>
		<?php } ?>
		<div class="col s12 m6 l4">
			<h5 class="white-text"><?php echo $text_service; ?></h5>
			<ul>
				<li><a class="white-text" href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				<li><a class="white-text" href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
				<li><a class="white-text" href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
			</ul>
		</div>
		<div class="col s12 m6 l4">
			<h5 class="white-text"><?php echo $text_account; ?></h5>
			<ul>
				<li><a class="white-text" href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
				<li><a class="white-text" href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
				<li><a class="white-text" href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
				<li><a class="white-text" href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
			</ul>
		</div>
	</div>
</div>
<div class="footer-copyright">
	<div class="container">
		<p><a class="white-text" href="http://serjbliznyuk.in">Material Design Template.</a> <?php echo $powered; ?></p>
	</div>
</div>
</footer>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-75434829-5', 'auto');
  ga('send', 'pageview');

</script>

</body></html>
