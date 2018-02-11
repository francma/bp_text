FILE=main
FILES:= $(shell find . -name '*.tex')

$(FILE).pdf: $(FILES)
	arara main --log 

clean:
	git clean -Xf

refresh: $(FILE).pdf
	pkill -SIGHUP mupdf

run: $(FILE).pdf
	mupdf $(FILE).pdf