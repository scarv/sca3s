BUILD = ${REPO_HOME}/build/spec

include ${REPO_HOME}/extern/texmf/make/image.mk

${BUILD}/spec.version :
	@echo ${REPO_VERSION} > ${@}

${BUILD}/spec.pdf     : ./spec.tex $(wildcard ./tex/*) ${IMAGE_TARGETS} ${BUILD}/spec.version
	@TEXINPUTS="${TEXINPUTS}:.:${BUILD}" pdflatex  -output-directory $(dir ${@}) $(basename ${<})
	@TEXINPUTS="${TEXINPUTS}:.:${BUILD}" biber    --output_directory $(dir ${@}) $(basename ${<})
	@TEXINPUTS="${TEXINPUTS}:.:${BUILD}" pdflatex  -output-directory $(dir ${@}) $(basename ${<})
	@TEXINPUTS="${TEXINPUTS}:.:${BUILD}" biber    --output_directory $(dir ${@}) $(basename ${<})
	@TEXINPUTS="${TEXINPUTS}:.:${BUILD}" pdflatex  -output-directory $(dir ${@}) $(basename ${<})

dir   :
	@mkdir --parents ${BUILD}
	@mkdir --parents ${BUILD}/image

all   : dir ${BUILD}/spec.pdf

clean :
	@rm -rf ${BUILD}
