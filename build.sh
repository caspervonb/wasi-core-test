#!/bin/bash
set -ueo pipefail

src_dir="src"
out_dir="out"
wasm_cc="/opt/wasi-sdk/bin/clang"

mkdir -p "$out_dir"
cp -u $src_dir/*.ts $out_dir

cd $out_dir
for input in *.ts; do
  echo "Compiling $input"
  asc --runtime stub -o "$(basename $input .ts).wasm" "$input"
done
