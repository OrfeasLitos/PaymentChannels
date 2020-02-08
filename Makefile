all: paymentChannels.pdf
full: red bib

#.ONESHELL:
paymentChannels.pdf: src/*
	echo "\newcommand{\toredden}{false}" >> src/preamble.sty
	export TEXINPUTS=.:./src//:; \
	pdflatex --shell-escape -halt-on-error -interaction=nonstopmode paymentChannels.tex; \
	rm -rf paymentChannels.aux paymentChannels.log paymentChannels.out paymentChannels.toc paymentChannels.lof paymentChannels.lot paymentChannels.bbl paymentChannels.blg paymentChannels-autopp.log paymentChannels-autopp.out paymentChannels-pics.pdf
	sed -i '$$d' src/preamble.sty

red: src/*
	echo "\newcommand{\toredden}{true}" >> src/preamble.sty
	cp src/paymentChannels.tex src/paymentChannelsRed.tex; \
	export TEXINPUTS=.:./src//:; \
	pdflatex --shell-escape -halt-on-error -interaction=nonstopmode paymentChannelsRed.tex; \
	bibtex paymentChannelsRed.aux; \
	pdflatex --shell-escape -halt-on-error -interaction=nonstopmode paymentChannelsRed.tex; \
	pdflatex --shell-escape -halt-on-error -interaction=nonstopmode paymentChannelsRed.tex
	rm -rf paymentChannelsRed.aux paymentChannelsRed.log paymentChannelsRed.out paymentChannelsRed.toc paymentChannelsRed.lof paymentChannelsRed.lot paymentChannelsRed.bbl paymentChannelsRed.blg paymentChannelsRed-autopp.log paymentChannelsRed-autopp.out paymentChannelsRed-pics.pdf
	sed -i '$$d' src/preamble.sty
	rm src/paymentChannelsRed.tex

bib: src/*
	echo "\newcommand{\toredden}{false}" >> src/preamble.sty
	export TEXINPUTS=.:./src//:; \
	pdflatex --shell-escape -halt-on-error -interaction=nonstopmode paymentChannels.tex; \
	bibtex paymentChannels.aux; \
	pdflatex --shell-escape -halt-on-error -interaction=nonstopmode paymentChannels.tex; \
	pdflatex --shell-escape -halt-on-error -interaction=nonstopmode paymentChannels.tex; \
	rm -rf paymentChannels.aux paymentChannels.log paymentChannels.out paymentChannels.toc paymentChannels.lof paymentChannels.lot paymentChannels.bbl paymentChannels.blg paymentChannels-autopp.out paymentChannels-pics.pdf
	sed -i '$$d' src/preamble.sty

state.pdf: src/*
	export TEXINPUTS=.:./src//:; \
	pdflatex statepdf.tex; \
	mv statepdf.pdf state.pdf; \
	rm -rf statepdf.aux statepdf.log statepdf.out

clean:
	rm -rf *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.pdf
