.PHONY: draftthesis.pdf thesis.pdf all clean deepclean check final

all: draftthesis.pdf

final: thesis.pdf

draftthesis.pdf: draftthesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $<

thesis.pdf: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $<

deepclean:
	latexmk -C

clean:
	latexmk -c

check:
	lacheck main.tex
