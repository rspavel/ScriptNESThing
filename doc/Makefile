LATEX=pdflatex
LATEXMK=latexmk

all: nesThingie.pdf

.PHONY: nesThingie.pdf

nesThingie.pdf:
	$(LATEXMK) -pdf nesThingie.tex

clean:
	${LATEXMK} -c -bibtex
