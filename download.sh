#!/bin/bash
# dowload.sh

wget --no-check-certificate https://zenodo.org/api/records/7764418/files-archive

unzip files-archive

unzip raw_datasets.zip

mv raw_datasets/* database/raw_datasets/

rm files-archive

rm raw_datasets.zip

rm -rf raw_datasets