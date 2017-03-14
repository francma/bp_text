FILE=main
FILES:= $(shell find . -name '*.tex')

$(FILE).pdf: $(FILES)
	for file in $$(find . -name '*.tex'); do vlna $$file; done;
	xetex -fmt=pdfcsplain $(FILE).tex
	# xetex -fmt=pdfcsplain $(FILE).tex
	# xetex -fmt=pdfcsplain $(FILE).tex

clean:
	find .  -maxdepth 1 -type f -regex '\(.*\.pdf\|.*\.pdf_tex\|.*\.aux\|.*\.log\|.*\.nav\|.*\.out\|.*\.snm\|.*\.toc\|.*\.ref\|.*\.te\~\|.*\.lbr\)' -delete

refresh: $(FILE).pdf
	pkill -SIGHUP mupdf

run: $(FILE).pdf
	mupdf $(FILE).pdf