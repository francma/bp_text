#!/bin/sh

set -eu

find . -name '*.tex' | xargs grep -Pho ' [A-Z]{2,}[\. ]?' {} \; | tr -d '. ' | sort | uniq