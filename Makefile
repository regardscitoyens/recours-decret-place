IN=$(wildcard */*.md)
OUT=$(patsubst %.md,%.pdf,$(IN))

all: $(OUT)

%.pdf: %.md logo.png
	pandoc --variable=lang:french  -s -S -o $@ $<

