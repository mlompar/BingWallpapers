# BingWallpapers
You can download latest image from www.bing.com. Here You can see how my crontab looks:
```bash
30 6 * * * /usr/local/bin/bing_wallpaper.sh > /home/milos/Pictures/bing.log 2>&1
```
So every morning script updates image in $HOME/Pictures/bing.jpg which is already set as wallpaper.

## Requirements
- bash
- grep
- sed
- curl
- ImageMagick
