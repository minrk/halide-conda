set -ex

if [[ $(uname) == "Darwin" ]]; then
    export CXXFLAGS="-stdlib=libc++ $CXXFLAGS"
fi

${CXX:-c++} $CXXFLAGS -std=c++11 -I$PREFIX/include $RECIPE_DIR/test.cpp \
    $LDFLAGS -Wl,-rpath,"$PREFIX/lib" -L$PREFIX/lib -lHalide -lz \
    -o test

./test
