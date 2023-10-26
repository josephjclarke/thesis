.PHONY: draftthesis.pdf thesis.pdf all clean deepclean check final debug draftprint print diff

all: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=oneside -DMODE=draft -DDOUBLESPACING= -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex -interaction=nonstopmode" --synctex=1 -use-make thesis.tex.pre

final: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=oneside -DMODE=final -DDOUBLESPACING= -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex -interaction=nonstopmode" --synctex=1 -use-make thesis.tex.pre

draftprint: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=twoside -DMODE=draft -DDOUBLESPACING= -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex -interaction=nonstopmode" --synctex=1 -use-make thesis.tex.pre

print: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=twoside -DMODE=final -DDOUBLESPACING= -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex -interaction=nonstopmode" --synctex=1 -use-make thesis.tex.pre

doublespacing: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=oneside -DMODE=draft -DDOUBLESPACING=\\doublespacing -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex -interaction=nonstopmode" --synctex=1 -use-make thesis.tex.pre

debug: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	cpp -DPAPERSIZE=a4paper -DSIDES=onesided -DMODE=draft -DDOUBLESPACING= -P thesis.tex thesis.tex.pre
	latexmk -pdf -jobname=thesis -pdflatex="pdflatex" --synctex=1 -use-make thesis.tex.pre

deepclean:
	make clean
	latexmk -CA

clean:
	rm -f */*.aux
	rm -f *.auxlock
	rm -f thesis.tex.*
	rm -f thesis.run.xml
	rm -f thesis.bbl
	rm -f thesis.tdo
	rm -f thesis.xdy
	rm -f thesis.ist
	rm -f *.fls
	latexmk -c

check:
	lacheck thesis.tex


diff: thesis.tex *.tex ./*/*.tex thesissettings.sty bibliography/bibliography.bib
	mkdir -p viva
	git archive --format=tar viva > viva/viva.tar

	cd viva ; tar xf viva.tar && \
	cpp -DPAPERSIZE=a4paper -DSIDES=oneside -DMODE=final -DDOUBLESPACING= -P thesis.tex prepped.tex && \
	latexpand --keep-comments --biber bibliography/bibliography.bib --output expanded_old.tex prepped.tex

	cpp -DPAPERSIZE=a4paper -DSIDES=oneside -DMODE=final -DDOUBLESPACING= -P thesis.tex thesis.tex.pre
	latexpand --keep-comments --biber bibliography/bibliography.bib --output expanded_new.tex thesis.tex.pre

	latexdiff --packages=hyperref,biblatex,siunitx,cleveref,glossaries,mhchem --type=CULINECHBAR expanded_new.tex viva/expanded_old.tex > diff.tex

	latexmk -pdf -jobname=diff -pdflatex="pdflatex -interaction=nonstopmode" -use-make diff.tex
	rm diff.tex
	rm expanded_new.tex
	rm -rf viva
