FILE=text

$(FILE).pdf: *.tex
	vlna $(FILE).tex
	arara $(FILE).tex

clean:
	find .  -maxdepth 1 -type f -regex '\(.*\.pdf\|.*\.pdf_tex\|.*\.aux\|.*\.log\|.*\.nav\|.*\.out\|.*\.snm\|.*\.toc\|.*\.ref\|.*\.te\~\|.*\.lbr\)' -delete

refresh: $(FILE).pdf
	pkill -SIGHUP mupdf

run: $(FILE).pdf
	mupdf $(FILE).pdf