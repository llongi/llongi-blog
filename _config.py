# Blog configuration
site.url = "http://l.longi.li"

blog = controllers.blog
blog.enabled = True
blog.path = "/blog"
blog.name = "llongi's blog"
blog.description = "We're not in Kansas anymore!"
blog.timezone = "CET"
blog.posts_per_page = 10
blog.post_excerpts.enabled = False
blog.auto_permalink.enabled = True
blog.disqus.enabled = True
blog.disqus.name = "llongi-blog"

mosaic = controllers.mosaic
mosaic.enabled = True

filters.syntax_highlight.style = "monokai"
