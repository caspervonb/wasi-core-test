#!/bin/bash
set -ueo pipefail

src_dir="src"
out_dir="out"
wasm_cc="/opt/wasi-sdk/bin/clang"

mkdir -p "$out_dir"
cp -u $src_dir/*.ts $out_dir

for input in "$out_dir"/*.ts; do
  echo "Compiling $input"
  asc --runtime stub -o "$out_dir/$(basename $input .ts).wasm" "$input"
done
