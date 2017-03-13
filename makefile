FILE=main

$(FILE).pdf: *.tex tex/navrh/*.tex
	vlna $(FILE).tex
	xetex -fmt=pdfcsplain $(FILE).tex
	# xetex -fmt=pdfcsplain $(FILE).tex
	# xetex -fmt=pdfcsplain $(FILE).tex

clean:
	find .  -maxdepth 1 -type f -regex '\(.*\.pdf\|.*\.pdf_tex\|.*\.aux\|.*\.log\|.*\.nav\|.*\.out\|.*\.snm\|.*\.toc\|.*\.ref\|.*\.te\~\|.*\.lbr\)' -delete

refresh: $(FILE).pdf
	pkill -SIGHUP mupdf

run: $(FILE).pdf
	mupdf $(FILE).pdf