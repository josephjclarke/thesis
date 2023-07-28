#!/bin/bash

cp -L bibliography.bib.link bibliography.bib
sed -E -i 's/month = \{(.*)\},/month = \1,/g' bibliography.bib
sed -i '1,5d' bibliography.bib
