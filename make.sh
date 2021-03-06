#!/bin/bash
#
# Präsentations-Slides für den Contao Stammtisch München

TALK=slides

# Javascript Framework für die Slides
FORMAT=revealjs
## #FORMAT=S5
## #FORMAT=Slidy
## #FORMAT=DZSlides
## #FORMAT=Slideous

# Für FORMAT=revealjs
#THEME=beige
THEME=black
#THEME=blood
#THEME=league
#THEME=moon
###THEME=night
#THEME=serif
#THEME=simple
#THEME=sky
#THEME=solarized
#THEME=white

# Syntax-Highlighting Style
#HIGHLIGHT=pygments
#HIGHLIGHT=kate
HIGHLIGHT=espresso
#HIGHLIGHT=haddock
#HIGHLIGHT=tango
#HIGHLIGHT=zenburn


if [ ! -d reveal.js ]
then
    echo "Bitte erst reveal.js von https://github.com/hakimel/reveal.js"
    echo "herunterladen und im Verzeichnis reveal.js installieren!"
    exit
fi

if [ ${FORMAT} == 'revealjs' ]
then
  pandoc \
    --to=${FORMAT} \
    --section-divs \
    --standalone \
    --variable theme=${THEME} \
    --variable slideNumber="true" \
    --variable controls="true" \
    --variable center="false" \
    --highlight-style ${HIGHLIGHT}  \
    ${TALK}.md \
    --output=${TALK}.html
  sed -i '' -e "s/simple.css/${THEME}.css/" ${TALK}.html
else
  pandoc --to=${FORMAT} --standalone ${TALK}.md --output=${TALK}.html
fi



# PDF für den Druck (Handouts)

pandoc ${TALK}.md --highlight-style ${HIGHLIGHT} --output=${TALK}.pdf

echo "done!"

## EOF ##
