<p>
	<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/"><img src="/images/cc-by-nc-sa-3.0.png" alt="Creative Commons License" /></a>
	<br />
	This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/">Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License</a>.
	<br />
	Powered by <a href="http://www.blogofile.com/">Blogofile</a>.
	<br />
	Design by <a href="http://www.nodethirtythree.com/">NodeThirtyThree</a> and <a href="http://www.freecsstemplates.org/">Free CSS Templates</a>.
</p>
% if bf.config.blog.disqus.enabled:
	<script type="text/javascript">
	//<![CDATA[
	(function() {
		var links = document.getElementsByTagName('a');
		var query = '?';
		for(var i = 0; i < links.length; i++) {
			if(links[i].href.indexOf('#disqus_thread') >= 0) {
				query += 'url' + i + '=' + encodeURIComponent(links[i].href) + '&';
			}
		}
		document.write('<script charset="utf-8" type="text/javascript" src="https://disqus.com/forums/${bf.config.blog.disqus.name}/get_num_replies.js' + query + '" async="async"></' + 'script>');
	})();
	//]]>
	</script>
% endif
