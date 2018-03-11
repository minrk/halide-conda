FROM ubuntu:16.04
RUN apt-get -y update && apt-get -y install build-essential
RUN apt-get -y install curl g++-4.9 g++-5
ENV CONDA_DIR=/opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH
RUN curl -L https://repo.continuum.io/miniconda/Miniconda3-4.4.10-Linux-x86_64.sh > miniconda.sh \
 && bash miniconda.sh -b -p $CONDA_DIR \
 && rm miniconda.sh \
 && conda config --add channels conda-forge \
 && conda update -y --all \
 && conda install conda-build=3.7 \
 && conda clean -tipsy

