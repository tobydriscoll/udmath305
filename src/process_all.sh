#!/usr/bin/env bash

echo "jing validation..."
java -classpath ~/Dropbox/etc/jing-trang/build -Dorg.apache.xerces.xni.parser.XMLParserConfiguration=org.apache.xerces.parsers.XIncludeParserConfiguration -jar ~/Dropbox/etc/jing-trang/build/jing.jar ~/Dropbox/books/mathbook/schema/pretext.rng notes305.xml
echo "...done jing"

echo "schematron validation..."
xsltproc -stringparam publisher webpublish.xml --xinclude ~/Dropbox/books/mathbook/schema/pretext-schematron.xsl notes305.xml
echo "...done schematron"

echo "Conversion to html..."
xsltproc --xinclude --stringparam html.css.colorfile "colors_delaware.css" ~/Dropbox/books/mathbook/xsl/mathbook-html.xsl notes305.xml
echo "...done html"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sed -i 's+https://pretextbook.org/css/0.31/colors_delaware+colors_delaware+' *.html
elif [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' 's+https://pretextbook.org/css/0.31/colors_delaware+colors_delaware+' *.html
fi
mv *.html ..
cp colors_delaware.css ..
mv knowl/* ../knowl

if [ "$1" == "-m" ] 
then
    echo "Extracting matlab codes..."
    xsltproc --xinclude ~/Dropbox/books/mathbook/xsl/extract-matlab.xsl notes305.xml
    echo "...done extraction"
    echo "Running matlab codes..."
    matlab -nodisplay < process_cmd.m
    echo "...done codes"
    mv matlab/*.svg ../matlab
    git add ../matlab/*.svg 
fi

git add ../*.html 
git add ../knowl/*
git add *.xml 

#cp -r * ~/Sites/305/
#open http://localhost/~driscoll/305/notes.html
