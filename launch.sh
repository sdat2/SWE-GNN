#!/bin/bash
# launch.sh

conda env create -n swegnn -f env.yml

conda init # add conda to bashrc

source ~/.bashrc # activate conda

conda activate swegnn # activate the environment

torch_version=$(python -c "import torch; print(torch.__version__)")
echo "torch_version: $torch_version"

pip uninstall torch-scatter torch-sparse torch-geometric  
pip install torch-scatter torch-sparse -f https://data.pyg.org/whl/torch-${torch_version}.html
pip install torch_geometric==2.2


cd database

pip install nbconvert

echo "which python"
which python

jupyter nbconvert --to notebook --inplace --execute create_dataset.ipynb

cd ..


# python main.py
