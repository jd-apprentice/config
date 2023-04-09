#!/bin/bash

themes=./themes/*.tar.xz

for f in $themes; do
    echo "🔴 Extracting $f..."
    tar -xf $f -C ./themes/ready2install
done

cp -r ./themes/ready2install/Ultimate-Maia-Black ~/.themes
cp -r ./themes/ready2install/Black-Maia-43 ~/.themes
cp -r ./themes/ready2