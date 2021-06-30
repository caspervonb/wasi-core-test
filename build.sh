#!/bin/bash
set -ueo pipefail

for input in *.ts; do
  output="$(basename $input .ts).wasm"
  if [ "$input" -nt "$output" ]; then
    echo "Compiling $input"
    asc --runtime stub -o "$(basename $input .ts).wasm" "$input"
  fi
done
