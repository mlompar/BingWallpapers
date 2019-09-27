#!/bin/bash
# Author: M. Lompar
# Version: 0.1, August 23rd, 2019

# retrieve links
bing_xml="https://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en_UN"
rel_image_url=$(curl "${bing_xml}" | \
                grep -oPm1 "(?<=<url>)[^<]+" | \
                sed "s/[0-9]+x[0-9]+/1920x1080/")
abs_image_url="https://www.bing.com${rel_image_url}"
copyright=$(curl "${bing_xml}" | grep -oPm1 "(?<=<copyright>)[^<]+")

# download image and add description at the bottom
curl "${abs_image_url}" > ${HOME}/Pictures/bing.jpg
convert ${HOME}/Pictures/bing.jpg -gravity South -background Khaki  -splice 0x48 -annotate +0+28 \
        "${copyright}" ${HOME}/Pictures/bing.jpg
