#!/bin/bash
set -ueo pipefail

src_dir="src"
out_dir="out"
wasm_cc="/opt/wasi-sdk/bin/clang"

mkdir -p "$out_dir"

for input in "$src_dir"/*; do
  echo "Copying $input"
  cp $input "$out_dir/$(basename $input)"
done

for input in "$out_dir"/*.ts; do
  echo "Compiling $input"
  asc --runtime stub -o "$out_dir/$(basename $input .ts).wasm" "$input"
done
