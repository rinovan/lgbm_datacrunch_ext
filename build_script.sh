#!/bin/sh

mkdir staging
git clone --recursive --branch v4.3.0 --depth 1 https://github.com/Microsoft/LightGBM 
cd LightGBM
git apply ../spearman.patch
git apply ../objectives.patch

bash ./build-python.sh bdist_wheel
cp ./dist/*.whl ./../staging
cd ../staging
unzip *.whl
cp -r ./lightgbm ../lightgbm
cd ..
rm -rf staging
