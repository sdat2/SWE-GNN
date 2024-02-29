#!/bin/bash 
#SBATCH --job-name=cnn2
#SBATCH --partition=par-single
#SBATCH -o log/%j.out 
#SBATCH -e log/%j.err
#SBATCH --time=48:00:00
#SBATCH -n 10
#SBATCH --mem=20000

# python env
conda activate swegnn

# executable 
python main.py
