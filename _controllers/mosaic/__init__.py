import os, shutil
from PIL import Image, ImageDraw, ImageFont
from blogofile.cache import bf

config = {
			"name"        	: 	"mosaic",
			"description" 	: 	"A gallery.",
			"author"		:	"startlingthings@gmail.com",
			"url"         	: 	"github.com/startlingthings",
			"path"			: 	"mosaic",
			"originals"		:	"_photos",
			"small"			:	(250, 250),
			"large"			:	(550, 550),
			"dir_thumb"		:	(250, 250),
			"label_colors"	:	("#ffffff", "#000000")
		}

def run():
	directory(config['originals'], config['path'], "")

def directory(source, destination, short):
	destination_full = os.path.join("_site", destination)
	os.mkdir(destination_full)

	photos, directories = read(source)

	copy(photos, source, destination_full)

	resize(photos, destination_full, "small", config['small'])
	resize(photos, destination_full, "large", config['large'])

	if short != "":
		directory_thumb(photos[0], destination_full, short)

	index(photos, directories, destination, short)
	photo_pages(photos, destination, short)

	for d in directories:
		directory(os.path.join(source, d), os.path.join(destination, d), d)

def read(directory):
	photos = ([])
	directories = ([])

	for p in os.listdir(directory):
		if os.path.isfile(os.path.join(directory, p)) and p.lower().endswith(".jpg"):
			photos.append(p)
		if os.path.isdir(os.path.join(directory, p)) and not bf.util.should_ignore_path(os.path.join(directory, p)):
			directories.append(p)

	photos.sort()
	directories.sort()

	return photos, directories

def copy(photos, source, destination):
	for photo in photos:
		shutil.copy2(os.path.join(source, photo), os.path.join(destination, photo))

def resize(photos, destination, subfolder, size):
	os.mkdir(os.path.join(destination, subfolder))

	for photo in photos:
		orig = os.path.join(destination, photo)
		resize = os.path.join(destination, subfolder, photo)

		im = Image.open(orig)
		im.thumbnail(size, Image.ANTIALIAS)
		im.save(resize)

def directory_thumb(photo, destination, short):
	# make two thumb-nails for each directory
	# one will be labeled with the name of that directory, one won't
	orig = os.path.join(destination, photo)
	labeled = os.path.join(destination, "index_labeled.jpg")
	unlabeled = os.path.join(destination, "index_unlabeled.jpg")

	im = Image.open(orig)
	im.thumbnail(config['dir_thumb'], Image.ANTIALIAS)
	im.save(unlabeled)

	x, y   = im.size
	down   = int(y * 0.8)
	height = 10

	draw = ImageDraw.Draw(im)
	draw.rectangle([(0, down), (x, down + height)], fill = config['label_colors'][0])

	font = ImageFont.load_default()
	draw.text((2, down), short, font = font, fill = config['label_colors'][1])

	im.save(labeled)

def index(photos, directories, destination, short):
	bf.writer.materialize_template(
		"mosaic_directory.mako",
		(destination, "index.html"),
		{
		"photos": photos,
		"directories": directories,
		"short": short
		}
	)

def photo_pages(photos, destination, short):
	for photo in photos:
		bf.writer.materialize_template(
			"mosaic_photo.mako",
			(destination, photo + ".html"),
			{
			"photo": photo,
			"short": short
			}
		)
