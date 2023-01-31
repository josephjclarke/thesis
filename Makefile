.DUMMY: thesis.pdf all clean

all: thesis.pdf

thesis.pdf: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
		latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $<

deepclean:
		latexmk -C
clean:
		latexmk -c

check:
		lacheck thesis.tex
