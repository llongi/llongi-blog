<%inherit file="site.mako" />

<div class="post">
	<h2 class="title">${short} / ${photo}</h2>
	<div class="entry" style="text-align: center;">
		<a href="${photo}" title="${photo}"><img src="large/${photo}" alt="${photo}" /></a>
	</div>
</div>

<%block name="sidebar_1"></%block>
<%block name="sidebar_3"></%block>
<%block name="sidebar_4"></%block>
<%block name="widebar"></%block>
