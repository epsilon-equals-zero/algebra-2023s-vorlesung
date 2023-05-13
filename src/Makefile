

MAINDOC = document.tex
PDF = document.pdf
JOBNAME = $(PDF:.pdf=)

.PHONY: all clean view release

all:
	latexmk -pdflua -bibtex $(MAINDOC) -jobname=$(JOBNAME)

clean:
	latexmk -pdflua -bibtex -C $(MAINDOC) -jobname=$(JOBNAME)
	rm -f $(JOBNAME).run.xml

view:
	evince $(PDF) >/dev/null 2>&1 &
