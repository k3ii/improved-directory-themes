#! /bin/bash

DISTRIBUTION=manjaro
HEADER=Manjaro

SOURCE_STYLING=/usr/local/share/improved-directory-themes
SHADES="$(cat $SOURCE_STYLING/$DISTRIBUTION-shades)"

cp $SOURCE_STYLING/site-footer.html "/vol-mirror/$DISTRIBUTION-mirror/.footer.html"
cp $SOURCE_STYLING/site-header.html "/vol-mirror/$DISTRIBUTION-mirror/.header.html"
cp $SOURCE_STYLING/.style.css "/vol-mirror/$DISTRIBUTION-mirror/.style.css"

footer="/vol-mirror/$DISTRIBUTION-mirror/.footer.html"
header="/vol-mirror/$DISTRIBUTION-mirror/.header.html"
style="/vol-mirror/$DISTRIBUTION-mirror/.style.css"

sed -i "s/dist/$HEADER/" "$header"

awk -v addpattern="$SHADES" '/Base Colors/{print $0 "\n" addpattern;next}1' $style  > /tmp/e-style.css
mv /tmp/e-style.css $style

