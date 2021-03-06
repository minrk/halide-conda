# halide conda recipes

These are recipes for repackaging the official halide releases as conda packages. To run:

    # build the linux packages
    make linux
    # build the mac package
    make mac
    # upload the packages to anaconda.org
    make upload CHANNEL=halide-lang LABEL=main CONDA_PREFIX=$HOME/conda

This creates a conda package for every gcc version on linux.
These have build strings that are the same as the label on the releases.

To test, you can install these from my channel.
Conda packages allow specifying `packagename=version=buildstring`,
so to pick gcc52 of the latest halide from the halide-lang channel:


    conda install -c halide-lang halide=*=*gcc52*

Ideally, these would bundle the required libgcc,
but gcc52 is the only libgcc in the range of halide releases that has a conda package. Conda folks have only packaged 4.8, 5.2, and 7.2.

To update for a new halide release, modify version number and shas in halide-repack/meta.yaml.
