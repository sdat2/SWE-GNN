# SWE-GNN (paper repository)

Code repository for paper "Rapid Spatio-Temporal Flood Modelling via Hydraulics-Based Graph Neural Networks"

(Version 1.1 (accepted version) - October 23rd, 2023)

![summary_figure](summary_figure.png)

All test video simulations can be found at <https://dx.doi.org/10.5281/zenodo.7652663>.

---

# Get started with running the model

* Download the dataset: <https://dx.doi.org/10.5281/zenodo.7764418>


```bash
        sh download.sh
```

* Install the required libraries:

```bash
          pip install -r requirements.txt
          
          conda env create -n swegnn -f env.yml
          
          # with micromamba
          micromamba create -n swegnn -f env.yml

          sh install.sh
```

* **IMPORTANT:** Convert the download dataset into pickle files: run **create_dataset.ipynb** inside the **database** folder

```bash

   cd database

   pip install nbconvert

   jupyter nbconvert --to notebook --inplace --execute create_dataset.ipynb

   du -h --max-depth=1 .

```

* Explore the other notebooks! Try starting with **try_model.ipynb**

* For reproducing the paper's results, you can run **plot_results.ipynb**

* For training the model
```bash
        python main.py
```

https://stackoverflow.com/questions/67285115/building-wheels-for-torch-sparse-in-colab-takes-forever

https://stackoverflow.com/questions/64664094/i-cannot-use-opencv2-and-received-importerror-libgl-so-1-cannot-open-shared-obj

---

## Repository 

The repository is divided in the following folders:

* **database:** Creation of hydrodynamic simulations (**D-Hydro simulations.ipynb**) [requires the license and installation of "D-HYDRO Suite 2023.01 1D2D"] and conversion of the NETCDF output files into PyTorch Geometric-friendly data (**create_dataset.ipynb**).
Also contains the output of the hydrodynamic simulations (**raw_datasets**: for downloading this dataset go to <https://dx.doi.org/10.5281/zenodo.7764418>). This is converted into Pickle files that are then stored and separated into training and testing datasets in **datasets**.

* **models:**  Deep learning models developed for surrogating the hydraulic one: contains MLP, CNN, and GNNs, as well as a base class with common inputs and functions.

* **results:** Contains trained models and respective configuration files, used for the paper's results.

* **training:** Contains loss functions, Trainer object, and testing functions.

* **utils:** Contains Python functions for loading, creating and scaling the dataset. There are also other miscellaneous functions and visualization functions.

This version of the repository is not very robust to changes in inputs, so be careful to adapt the `utils.dataset` functions when you want to apply the model to a new dataset!
The next version is much more flexible and also works with meshes, but it will be published later on, hehe.

## Cite

Please cite [our paper](https://hess.copernicus.org/articles/27/4227/2023/) as:

```bibtex
@Article{hess-27-4227-2023,
AUTHOR = {Bentivoglio, R. and Isufi, E. and Jonkman, S. N. and Taormina, R.},
TITLE = {Rapid spatio-temporal flood modelling via hydraulics-based graph neural networks},
JOURNAL = {Hydrology and Earth System Sciences},
VOLUME = {27},
YEAR = {2023},
NUMBER = {23},
PAGES = {4227--4246},
URL = {https://hess.copernicus.org/articles/27/4227/2023/},
DOI = {10.5194/hess-27-4227-2023}
}
```
