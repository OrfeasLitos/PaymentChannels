all: paymentChannels.pdf

#.ONESHELL:
paymentChannels.pdf: src/*
	export TEXINPUTS=.:./src//:; \
	pdflatex paymentChannels.tex; \
	bibtex paymentChannels.aux; \
	pdflatex paymentChannels.tex; \
	pdflatex paymentChannels.tex; \
	rm -rf paymentChannels.aux paymentChannels.log paymentChannels.out paymentChannels.toc paymentChannels.lof paymentChannels.lot paymentChannels.bbl paymentChannels.blg

clean:
	rm -rf *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.pdf
