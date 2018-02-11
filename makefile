FILE=main
FILES:= $(shell find . -name '*.tex')

$(FILE).pdf: $(FILES)
	arara main

clean:
	git clean -Xf

refresh: $(FILE).pdf
	pkill -SIGHUP mupdf

run: $(FILE).pdf
	xdg-open $(FILE).pdf