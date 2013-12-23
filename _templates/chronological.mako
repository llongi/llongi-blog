<%inherit file="site.mako" />

% for post in posts:
	<%include file="post.mako" args="post=post" />
	<br />
	<hr />
% endfor

<br />
% if prev_link:
	<a href="${prev_link}" title="Previous Page">&lt;&lt; Previous Page</a>
% endif
% if prev_link and next_link:
	  --  
% endif
% if next_link:
	<a href="${next_link}" title="Next Page">Next Page &gt;&gt;</a>
% endif
 (Page ${page_num} of ${page_total})
