#!/usr/bin/env bash
set -e
mkdir -p target
if command -v mvn >/dev/null 2>&1; then
    mvn clean package
elif command -v jar >/dev/null 2>&1; then
    jar cf target/jasper-bangla-fonts.jar -C src/main/resources .
    echo "Built target/jasper-bangla-fonts.jar using JDK jar tool."
else
    echo "Error: Neither 'mvn' nor 'jar' found in PATH."
    exit 1
fi
