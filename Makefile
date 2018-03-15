.PHONY: build-image mac linux upload

CHANNEL ?= halide-lang
LABEL ?= main
CONDA_PREFIX ?= $(HOME)/conda

build-image:
	docker build -t halide-conda-build image

mac:
	conda build halide-repack

linux: build-image
	docker run --rm -it -v$(CURDIR):/io -v$(CURDIR)/conda-bld:/opt/conda/conda-bld halide-conda-build /io/docker-build-all

upload:
	anaconda upload -u $(CHANNEL) -l $(LABEL) $(CONDA_PREFIX)/conda-bld/osx-64/halide-*
	anaconda upload -u $(CHANNEL) -l $(LABEL) conda-bld/linux-64/halide-*
