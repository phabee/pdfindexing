#!/bin/sh

# author: fabian leuthold        
# date:   2016-05-26

# this script uses pdfsandwich from tobias elze to process the 
# current directory and convert all existing non-searchable pdfs 
# to pdf/a files to make them searchable.
# all pdf's not ending with *_ocr.pdf are considered to be input
# files and a searchable pdf with the extension *_ocr.pdf will be
# generated.

# see 'http://www.tobias-elze.de/pdfsandwich/' for details on 
# pdfsandwich.

#!/bin/bash
FILES=./*.pdf
for f in $FILES
do
 case $f in
  *_ocr.pdf)
   ;;
  *.pdf)
   # make sure, no corresponding _ocr.pdf fiile exists
   ocrchk=$(echo $f | sed "s/.pdf/_ocr.pdf/")
   if [ ! -e "./$ocrchk" ]; then
    echo "Processing $f file..."
    pdfsandwich -rgb $f>/dev/null 2>/dev/null
   fi;;
  *)
 esac
done
