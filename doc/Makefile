BUILD = ${REPO_HOME}/build/doc

${BUILD}/doc.pdf : ./doc.tex $(wildcard ./tex/* ./image/*)
	@TEXINPUTS="${TEXINPUTS}:.:${BUILD}" pdflatex  -output-directory ${BUILD} $(basename ${<})
	@TEXINPUTS="${TEXINPUTS}:.:${BUILD}" biber    --output_directory ${BUILD} $(basename ${<})
	@TEXINPUTS="${TEXINPUTS}:.:${BUILD}" pdflatex  -output-directory ${BUILD} $(basename ${<})
	@TEXINPUTS="${TEXINPUTS}:.:${BUILD}" biber    --output_directory ${BUILD} $(basename ${<})
	@TEXINPUTS="${TEXINPUTS}:.:${BUILD}" pdflatex  -output-directory ${BUILD} $(basename ${<})

.PHONY: image

dir   :
	@mkdir --parents ${BUILD}
	@mkdir --parents ${BUILD}/image

image :

all   : dir image ${BUILD}/doc.pdf

clean :
	@rm -rf ${BUILD}
