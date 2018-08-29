#!/bin/sh

# $1 - template name
# $2 - content directory (optional)

cd "$(dirname "$0")"

WRKDIR=`pwd`
if [ -z "$2" ]; then
    CONTENTDIR="$WRKDIR/sample-content"
else
    CONTENTDIR=$2
fi
TEMPLATE=$1

export TEXINPUTS="$CONTENTDIR:$TEXINPUTS"
export BIBINPUTS="$CONTENTDIR:$BIBINPUTS"

cd $TEMPLATE
./make.sh
mv document.pdf $CONTENTDIR/$TEMPLATE.pdf

# cleanup
rm document.aux
rm document.bbl
rm document.blg
rm document.toc
rm document.log