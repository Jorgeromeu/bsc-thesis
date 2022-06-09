svgs=$(wildcard img/svg/*.svg)
svgs_out := $(patsubst img/svg/%.svg, img/svg_out/%.pdf, $(svgs))

dots=$(wildcard img/dot/*.dot)
dots_out := $(patsubst img/dot/%.dot, img/dot_out/%.pdf, $(dots))

neatos=$(wildcard img/neato/*.dot)
neatos_out := $(patsubst img/neato/%.dot, img/neato_out/%.pdf, $(neatos))

images := $(neatos_out) $(dots_out) $(svgs_out)

all: $(images)

svgs: $(svgs_out)
img/svg_out/%.pdf: img/svg/%.svg
	inkscape $< --export-area-drawing --export-latex -o $@

dots: $(svgs_out)
img/dot_out/%.pdf: img/dot/%.dot
	dot -Tpdf $< -o $@

neatos: $(svgs_out)
img/neato_out/%.pdf: img/neato/%.dot
	neato -Tpdf $< -o $@

print:
	echo $(svgs_out)
