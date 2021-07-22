#!/bin/bash
git clone https://github.com/vredwine/metadetect-extra-files.git runfiles
cd runfiles/run_galexp_psfgauss_shearscene
conda create --name testsim
conda activate testsim
conda config --set always_yes yes
conda install -y -q pip nomkl numpy galsim flake8 pytest joblib tqdm scikit-learn esutil meds numba lsstdesc.weaklensingdeblending des-sxdes
conda update --all -y -q

pip install git+https://github.com/esheldon/metadetect.git 
 --no-deps --no-cache-dir
pip install git+https://github.com/esheldon/mof.git 
 --no-deps --no-cache-dir
pip install git+https://github.com/esheldon/ngmix.git@v1.3.x 
 --no-deps --no-cache-dir 
pip install git+https://github.com/beckermr/metadetect-sims.git 
 --no-deps --no-cache-dir 
pip install pylbfgs 
 --no-deps --no-cache-dir
pip install schwimmbad  
 --no-deps --no-cache-dir
pip install fitsio 

python3 run_sim.py "5"
