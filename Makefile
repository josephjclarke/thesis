.DUMMY: thesis.pdf all clean

all: thesis.pdf

thesis.pdf: thesis.tex
		latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make $<

deepclean:
		latexmk -C
clean:
		latexmk -c
