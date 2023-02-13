.PHONY: draftthesis.pdf thesis.pdf all clean deepclean check final debug

#all: draftthesis.pdf
#
#final: thesis.pdf

all: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=oneside -DMODE=draft -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex -interaction=nonstopmode" -use-make thesis.tex.pre

final: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=oneside -DMODE=final -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex -interaction=nonstopmode" -use-make thesis.tex.pre

draftprint: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=twoside -DMODE=draft -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex -interaction=nonstopmode" -use-make thesis.tex.pre

print: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=twoside -DMODE=final -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex -interaction=nonstopmode" -use-make thesis.tex.pre


debug: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=onesided -DMODE=draft -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex" -use-make thesis.tex.pre

deepclean:
	rm -f thesis.tex.pre
	rm -f */*.aux
	latexmk -C

clean:
	rm -f thesis.tex.pre
	rm -f */*.aux
	latexmk -c

check:
	lacheck thesis.tex
