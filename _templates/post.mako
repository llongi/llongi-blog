<%page args="post" />

<div class="post">
	<h2 class="title"><a href="${post.path}" rel="bookmark" title="${post.title}">${post.title}</a></h2>
	<div class="entry">
		${self.post_prose(post)}
	</div>
	<p class="meta">
		<span class="posted">Posted by ${post.author} on ${post.date.strftime("%d %b %Y at %H:%M")}</span>
		<br />
		<span class="posted">Categories: 
		<%
		category_links = []
		for category in post.categories:
			if post.draft:
				category_links.append(category.name)
			else:
				category_links.append('<a href="%s" title="%s">%s</a>' % (category.path, category.name, category.name))
		%>
		${", ".join(category_links)}
		</span>
		% if bf.config.blog.disqus.enabled:
			<a href="${post.permalink}#disqus_thread" class="comments" title="Comments">Comments</a>
		% endif
	</p>
</div>

<%def name="post_prose(post)">
	${post.content}
</%def>
