set -xeuo pipefail

# why is the dylib in bin/?
mkdir -p "${PREFIX}/lib"
cp bin/libHalide* "${PREFIX}/lib/"
cp lib/* "${PREFIX}/lib/"

if [[ $(uname) == "Darwin" ]]; then
    LIBHALIDE="${PREFIX}/lib/libHalide.dylib"
    install_name_tool -id "${LIBHALIDE}" "${LIBHALIDE}"
fi


mkdir -p "${PREFIX}/include"
cp include/* "${PREFIX}/include/"

mkdir -p "${PREFIX}/share/halide"
cp -r tools "${PREFIX}/share/halide/tools"
cp -r tutorial "${PREFIX}/share/halide/tutorial"
