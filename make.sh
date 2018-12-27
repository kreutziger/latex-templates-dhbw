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

echo "Content directory: $CONTENTDIR"

cd $TEMPLATE
./make.sh
if [ -f document.pdf ]; then
    mv document.pdf "$CONTENTDIR/$TEMPLATE.pdf"
fi

# cleanup
rm -f document.aux
rm -f document.bbl
rm -f document.blg
rm -f document.toc
rm -f document.log
rm -f document.out