<li>
	<h3>Categories</h3>
	<ul>
	% for category, num_posts in bf.config.blog.all_categories:
		<li><a href="${category.path}feed/index.xml" title="${category} RSS"><img src="/images/xml.gif" alt="RSS" /></a> <a href="${category.path}" title="${category}">${category}</a> (${num_posts})</li>
	% endfor
	</ul>
</li>
