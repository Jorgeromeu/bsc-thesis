svgs=$(wildcard img/svg/*.svg)
svgs_out := $(patsubst img/svg/%.svg, img/svg_out/%.pdf, $(svgs))

tikzs=$(wildcard img/tikz/*.tex)
tikzs_out := $(patsubst img/tikz/%.tex, img/tikz_out/%.pdf, $(tikzs))

images := $(svgs_out) $(tikzs_out)

svgs: $(svgs_out)
img/svg_out/%.pdf: img/svg/%.svg
	inkscape $< --export-area-drawing -o $@

tikzs: $(tikzs_out)
img/tikz_out/%.pdf: img/tikz/%.tex
	pdflatex -interaction=nonstopmode $<
	cp $< $@

clean:
	rm *.aux
	rm *.log
	rm *.out
	rm *.toc
	rm __latexindent_temp.tex
