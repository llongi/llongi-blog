<h3>Latest posts</h3>
<ul>
	% for post in bf.config.blog.posts[:10]:
		<li><a href="${post.path}" title="${post.title}">${post.title}</a></li>
	% endfor
</ul>
