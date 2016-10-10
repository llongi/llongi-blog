llongi-blog
===========
blogofile build
rsync -a --exclude=README.md _site/* ../llongi-blog-deploy/static/
python ../google_appengine/appcfg.py update ../llongi-blog-deploy/
