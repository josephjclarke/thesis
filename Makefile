.PHONY: draftthesis.pdf thesis.pdf all clean deepclean check final debug draftprint print

all: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=oneside -DMODE=draft -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex -interaction=nonstopmode" --synctex=1 -use-make thesis.tex.pre

final: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=oneside -DMODE=final -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex -interaction=nonstopmode" --synctex=1 -use-make thesis.tex.pre

draftprint: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=twoside -DMODE=draft -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex -interaction=nonstopmode" --synctex=1 -use-make thesis.tex.pre

print: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=twoside -DMODE=final -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex -interaction=nonstopmode" --synctex=1 -use-make thesis.tex.pre


debug: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=onesided -DMODE=draft -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex" --synctex=1 -use-make thesis.tex.pre

deepclean:
	make clean
	latexmk -CA

clean:
	rm -f */*.aux
	rm -f thesis.tex.*
	rm -f thesis.run.xml
	rm -f thesis.bbl
	rm -f thesis.tdo
	latexmk -c

check:
	lacheck thesis.tex
