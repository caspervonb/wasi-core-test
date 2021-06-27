#!/bin/bash
set -ueo pipefail

src_dir="src"
out_dir="out"

mkdir -p "$out_dir"
cp -u $src_dir/*.ts $out_dir

cd $out_dir
for input in *.ts; do
  output="$(basename $input .ts).wasm"
  if [ "$input" -nt "$output" ]; then
    echo "Compiling $input"
    asc --runtime stub -o "$(basename $input .ts).wasm" "$input"
  fi
done
