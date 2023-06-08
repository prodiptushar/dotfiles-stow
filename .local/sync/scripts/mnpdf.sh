
# if images are not straced , squire shaped images
mnpdf_non_streched(){
for d in */ ; do
  convert "$(echo $d | sed 's/\///g')"/* -resize 1240x1753 \
                      -extent 1240x1753 -gravity center \
                      -units PixelsPerInch -density 150x150 "$(echo $d | sed 's/\///g')".pdf 
  rm -rf "$d"
done
 }

# if images are straced
# if straced change the -extent acording to the file command output and add it instad of -page 
mnpdf_streched(){
for d in */ ; do
  convert "$(echo $d | sed 's/\///g')"/* -page a4 "$(echo $d | sed 's/\///g')".pdf 
#  rm -rf "$d"
done
 }

