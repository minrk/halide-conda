#!/bin/bash
set -xeuo pipefail

export LIBHALIDE=$PREFIX/lib/libHalide$SHLIB_EXT
cd python_bindings
make -j${CPU_COUNT}

# install the module
cp bin/halide*.so "$SP_DIR/"
