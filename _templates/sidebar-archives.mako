<li>
	<h3>Archives</h3>
	<ul>
	% for link, name, num_posts in bf.config.blog.archive_links:
		<li><a href="${bf.config.blog.path}/${link}/1/" title="${name}">${name}</a> (${num_posts})</li>
	% endfor
	</ul>
</li>
