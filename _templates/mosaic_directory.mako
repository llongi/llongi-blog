<%inherit file="site.mako" />

<div class="post">
	<h2 class="title">Gallery / ${short}</h2>
	<div class="entry" style="text-align: center;">
		% for d in directories:
			<a href="${d}/" title="${d}"><img src="${d}/index_labeled.jpg" alt="${d}" /></a>
		% endfor
		% for photo in photos:
			<a href="${photo}.html" title="${photo}"><img src="small/${photo}" alt="${photo}" /></a>
		% endfor
	</div>
</div>

<%block name="sidebar_1"></%block>
<%block name="sidebar_3"></%block>
<%block name="sidebar_4"></%block>
<%block name="widebar"></%block>
