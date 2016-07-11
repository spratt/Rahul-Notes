######################################################################
# LatexTemplate Makefile
# By Simon Pratt
# November 10, 2010
######################################################################

DOCUMENT    = Saladi-Notes

REFERENCES  = Saladi-Notes-References

PARTS       = $(wildcard *.tex)

FIGURES		= figures

######################################################################
# Modify the following at your own risk
######################################################################

.PHONY: open clean

MAIN_TEX	= $(DOCUMENT).tex

BIBFILES    = $(addsuffix .bib,$(REFERENCES))

PDF     	= $(DOCUMENT).pdf

RUBBER		= rubber
RUBBEROPTS	= --pdf

CHKTEX		= chktex
CHKTEXOPTS  = -q -v -l chktexrc

$(PDF): $(CHECKPARTS) $(PARTS) $(BIBFILES)# $(FIGURES)/*

# should probably use a tool like rubber, but this works
%.pdf:	%.tex
	$(CHKTEX) $(CHKTEXOPTS) $<
	$(RUBBER) $(RUBBEROPTS) $<

# add stuff to delete here
clean:
	$(RUBBER) --clean --pdf
	rm -f $(PDF)
