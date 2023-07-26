#!/bin/bash

sed -E -i 's/month = \{(.*)\},/month = \1,/g' bibliography.bib
