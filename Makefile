MARKDOWNS=$(wildcard */*.md)
PDFS=$(patsubst %.md,%.pdf,$(MARKDOWNS))
JOINEDPDFS=$(patsubst %,joined-%.pdf,$(wildcard 20*))

all: $(PDFS) pdfjoins.mk $(JOINEDPDFS)

%.pdf: %.md logo.png
	pandoc --variable=lang:french  -s -S -o $@ $<

pdfjoins.mk: $(PDFS)
	echo -n "" > $@
	find . -mindepth 1 -maxdepth 1 -type d -name "20*" | \
	  while read d; do \
	    files=$$(find $$d -name '*.pdf' | sort | tr '\n' ' '); \
	    echo "joined-$$(basename $$d).pdf: $$files" >> $@; \
	    echo "	gs -q -sPAPERSIZE=a4 -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=\$$@ \$$^" >> $@; \
	  done

include pdfjoins.mk

clean:
	@rm $(PDFS)
	@rm $(JOINEDPDFS)
	@rm pdfjoins.mk


