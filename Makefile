.PHONY: build-image mac linux

build-image:
	docker build -t halide-conda-build image

mac:
	conda build halide-repack

linux: build-image
	docker run --rm -it -v$(CURDIR):/io -v$(CURDIR)/conda-bld:/opt/conda/conda-bld halide-conda-build /io/docker-build-all
