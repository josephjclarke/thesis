.PHONY: draftthesis.pdf thesis.pdf all clean deepclean check final

all: draftthesis.pdf

final: thesis.pdf

draftthesis.pdf: draftthesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $<

thesis.pdf:      finalthesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -user-make -job-name=thesis $<

deepclean:
	latexmk -C

clean:
	latexmk -c

check:
	lacheck thesis.tex
