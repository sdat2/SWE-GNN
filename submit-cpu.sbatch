#!/bin/bash 
#SBATCH --job-name="mlp"
#SBATCH --partition=par-single
#SBATCH -o log/%j.out 
#SBATCH -e log/%j.err
#SBATCH --time=48:00:00
#SBATCH -n 14
#SBATCH --mem=22000

# python env
conda activate swegnn

# executable 
python main.py
