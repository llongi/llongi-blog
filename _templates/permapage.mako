<%inherit file="site.mako" />
<%include file="post.mako" args="post=post" />

% if bf.config.blog.disqus.enabled:
	<div id="disqus_thread"></div>
	<script type="text/javascript">
		var disqus_url = "${post.permalink}";
	</script>
	<script type="text/javascript" src="https://disqus.com/forums/${bf.config.blog.disqus.name}/embed.js" async defer></script>
	<noscript>
		<p>
			<br />
			<a href="https://${bf.config.blog.disqus.name}.disqus.com/?url=ref">View the discussion thread.</a>
			<br />
		</p>
	</noscript>
	<br />
	<a href="https://disqus.com/" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>
% endif
