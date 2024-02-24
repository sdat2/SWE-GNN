#!/bin/bash 
#SBATCH --partition=par-single
#SBATCH -o %j.out 
#SBATCH -e %j.err
#SBATCH --time=24:00:00

# python env
conda activate swegnn

# executable 
python main.py
