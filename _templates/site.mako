<%inherit file="base.mako" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Pluralism
Description: A two-column, fixed-width template fit for 1024x768 screen resolutions.
Version    : 1.0
Released   : 20071218
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%include file="head.mako" />
</head>
<body>
<div id="wrapper">
	<div id="wrapper2">
		<div id="header">
			<%include file="header.mako" />
		</div>
		<div id="page">
			<div id="content">
				${next.body()}
			</div>
			<%block name="sidebar">
				<div id="sidebar">
					<ul>
						<%block name="sidebar_1">
							<%include file="sidebar-feeds.mako" />
						</%block>
						<%block name="sidebar_2">
							<%include file="sidebar-search.mako" />
						</%block>
						<%block name="sidebar_3">
							<%include file="sidebar-categories.mako" />
						</%block>
						<%block name="sidebar_4">
							<%include file="sidebar-archives.mako" />
						</%block>
					</ul>
				</div>
			</%block>
			<div style="clear: both;">&nbsp;</div>
			<%block name="widebar">
				<div id="widebar">
					<div id="colA">
						<%block name="widebar_1">
							<%include file="widebar-lposts.mako" />
						</%block>
					</div>
					<div id="colC">
						<%block name="widebar_2">
							<%include file="widebar-projects.mako" />
						</%block>
					</div>
					<div id="colB">
						<%block name="widebar_3">
							<%include file="widebar-blogroll.mako" />
						</%block>
					</div>
					<div style="clear: both;">&nbsp;</div>
				</div>
			</%block>
		</div>
	</div>
	<div id="footer">
		<%include file="footer.mako" />
	</div>
</div>
</body>
</html>
