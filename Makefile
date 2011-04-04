# Ubuntu Requirements
# -------------------
# texlive-latex-base
# texlive-latex-recommended
# texlive-latex-extra
# texlive-fonts-recommended

TEXARGS=-halt-on-error -output-directory=tmp/
TEX=pdflatex ${TEXARGS}

all: init tmp/main.bbx compile view

init:
	@mkdir -p tmp

compile:
	${TEX} main.tex
	cd tmp; bibtex main
	${TEX} main.tex

tmp/main.bbx: bibstyler/main.bbx.tmpl bibstyler/main.bbx.build
	bibstyler/main.bbx.build

view:
	evince tmp/main.pdf

clean:
	rm tmp/*

