#!/usr/bin/env bash

echo "jing validation..."
java -classpath ~/Dropbox/etc/jing-trang/build -Dorg.apache.xerces.xni.parser.XMLParserConfiguration=org.apache.xerces.parsers.XIncludeParserConfiguration -jar ~/Dropbox/etc/jing-trang/build/jing.jar ~/Dropbox/books/mathbook/schema/pretext.rng notes305.xml
echo "...done jing"

echo "schematron validation..."
xsltproc --xinclude ~/Dropbox/books/mathbook/schema/pretext-schematron.xsl notes305.xml
echo "...done schematron"

echo "Conversion to html..."
xsltproc --xinclude --stringparam html.css.extra "mathbook-delaware.css" ~/Dropbox/books/mathbook/xsl/mathbook-html.xsl notes305.xml
echo "...done html"
mv *.html ..
mv knowl/* ../knowl

echo "Extraction of matlab codes..."
xsltproc --xinclude ~/Dropbox/books/mathbook/xsl/extract-matlab.xsl notes305.xml
echo "...done extraction"

#echo "Running matlab codes..."
#matlab -nodisplay -r process_matlab
#echo "...done codes"
#mv matlab/*.svg ../matlab


#cp -r * ~/Sites/305/
#open http://localhost/~driscoll/305/notes.html
