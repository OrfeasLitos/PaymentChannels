all: paymentChannels.pdf

#.ONESHELL:
paymentChannels.pdf: src/*
	export TEXINPUTS=.:./src//:; \
	pdflatex --shell-escape -halt-on-error -interaction=nonstopmode paymentChannels.tex; \
	rm -rf paymentChannels.aux paymentChannels.log paymentChannels.out paymentChannels.toc paymentChannels.lof paymentChannels.lot paymentChannels.bbl paymentChannels.blg paymentChannels-autopp.log paymentChannels-autopp.out paymentChannels-pics.pdf

bib: src/*
	export TEXINPUTS=.:./src//:; \
	pdflatex --shell-escape -halt-on-error -interaction=nonstopmode paymentChannels.tex; \
	bibtex paymentChannels.aux; \
	pdflatex --shell-escape -halt-on-error -interaction=nonstopmode paymentChannels.tex; \
	pdflatex --shell-escape -halt-on-error -interaction=nonstopmode paymentChannels.tex; \
	rm -rf paymentChannels.aux paymentChannels.log paymentChannels.out paymentChannels.toc paymentChannels.lof paymentChannels.lot paymentChannels.bbl paymentChannels.blg paymentChannels-autopp.out paymentChannels-pics.pdf

state.pdf: src/*
	export TEXINPUTS=.:./src//:; \
	pdflatex statepdf.tex; \
	mv statepdf.pdf state.pdf; \
	rm -rf statepdf.aux statepdf.log statepdf.out

clean:
	rm -rf *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.pdf
