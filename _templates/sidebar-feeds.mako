<li>
	<h3>Feeds</h3>
	<a href="${bf.config.blog.path}/feed/index.xml" title="Entries RSS"><img src="/images/xml.gif" alt="RSS" /> Entries RSS</a>
	<br />
	<a href="${bf.config.blog.path}/feed/atom/index.xml" title="Entries Atom"><img src="/images/xml.gif" alt="RSS" /> Entries Atom</a>
	% if bf.config.blog.disqus.enabled:
		<br />
		<a href="https://${bf.config.blog.disqus.name}.disqus.com/latest.rss" title="Comments RSS"><img src="/images/xml.gif" alt="RSS" /> Comments RSS</a>
	% endif
</li>
