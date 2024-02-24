#!/bin/bash
# dowload.sh

wget --no-check-certificate https://zenodo.org/api/records/7764418/files-archive

unzip files-archive

unzip raw_datasets.zip

mv raw_datasets/* database/raw_datasets/

rm files-archive

rm raw_datasets.zip

rm -rf raw_datasets

# conda must be installed and initialized

conda activate swegnn

cd database

pip install nbconvert
pip install jupyter_contrib_nbextensions

echo "which python"
which python

# Test if Jupyter exists

if ! command -v -- "jupyter" > /dev/null 2>&1; then
    printf >&2 '%s\n' "I think I am missing jupyter"
    jupyter-nbconvert --to notebook --inplace --execute create_dataset.ipynb
else
    jupyter nbconvert --to notebook --inplace --execute create_dataset.ipynb
fi

cd ..
