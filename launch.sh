# launch.sh

wget --no-check-certificate https://zenodo.org/api/records/7764418/files-archive

unzip files-archive

unzip raw_datasets.zip

mv raw_datasets/* database/raw_datasets/

rm files-archive

rm raw_datasets.zip

rm -rf raw_datasets


conda env create -n swegnn -f env.yml

pip uninstall torch-scatter torch-sparse torch-geometric torch-cluster  
pip install torch-scatter -f https://data.pyg.org/whl/torch-1.13.1+cu111.html
pip install torch-sparse -f https://data.pyg.org/whl/torch-1.13.1+cu111.html
pip install torch-cluster -f https://data.pyg.org/whl/torch-1.13.1+cu111.html
pip install torch_geometric==2.2


cd database

pip install nbconvert

jupyter nbconvert --to notebook --inplace --execute create_dataset.ipynb

cd ..


python main.py