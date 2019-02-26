#!/bin/bash
mkdir -p "$PREFIX/bin"
export MACHTYPE=x86_64
export BINDIR=$(pwd)/bin
export LIBRARY_PATH=$PREFIX/lib
mkdir -p "$BINDIR"
(cd kent/src/lib && make)
(cd kent/src/htslib && make)
(cd kent/src/jkOwnLib && make)
(cd kent/src/hg/lib && make)
export LD_LIBRARY_PATH=$PREFIX/lib
(cd kent/src/utils/stringify && make)
(cd kent/src/hg/utils/overlapSelect && make)
cp bin/overlapSelect "$PREFIX/bin"
chmod +x "$PREFIX/bin/overlapSelect"
