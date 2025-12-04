# WCS2025 - Practical Material for the Boolean Modelling and Multiscale Simulations Course
Winter 2025, Wellcome Trust Genome Campus, Hinxton

This repository contains the practical material for the hands-on sessions on Boolean modelling with MaBoSS and multiscale simulations with PhysiBoSS. It includes a Jupyter notebook with interactive exercises, example prostate cancer models, and setup instructions to reproduce the analyses.

## Contents

- `Exercise_MaBoSS_PhysiBoSS.ipynb` — Main hands-on notebook used in the practical sessions. It demonstrates model loading, Boolean network simulations with MaBoSS, mutant analysis, cell-line-specific models, and multiscale simulations with PhysiBoSS.
- `models/` — Boolean network models in MaBoSS format (.bnd and .cfg files)
  - `Montagud2022_Prostate_Cancer.bnd/cfg` — Wild-type prostate cancer model
  - `cell_lines/` — Patient-specific and cell-line-specific versions of the prostate cancer model
- `additional_files/` — Configuration files and scripts for PROFILE_v2 and PhysiBoSS simulations
- `setup_repos.sh` — Automated script to clone PROFILE_v2 and PhysiBoSS repositories and set up local configuration files
- `img/` — Supporting figures and images
- `LICENSE` — BSD 3-Clause license for the repository

## Citation and references

This material has been prepared by Arnau Montagud, adapted from Vincent Noël and is based on the prostate cancer Boolean model presented in:

Montagud, A., Béal, J., Tobalina, L., Traynard, P., Subramanian, V., Szalai, B., Alföldi, R., Puskás, L., Valencia, A., Barillot, E., Saez-Rodriguez, J., & Calzone, L. (2022). "Patient-specific Boolean models of signalling networks guide personalised treatments". *eLife*, **11**, e72626. https://doi.org/10.7554/eLife.72626

The material also references:

Vincent Noël, Aurélien Naldi, Laurence Calzone, Loïc Paulevé, and Denis Thieffry (2025). "Reproducible Boolean model analyses and simulations with the CoLoMoTo software suite: a tutorial". *Interface Focus*. **15**: 20250002.

Please cite these papers when reusing or adapting this material.

## Quick overview

The notebook walks through:

- **Hands-on 1**: Loading Boolean network models with pyMaBoSS, running default simulations, and analyzing state probability distributions
- **Hands-on 2**: Simulating mutants (knock-out/inhibition) and performing sensitivity analysis to identify drug targets
- **Hands-on 3**: Working with patient-specific and cell-line-specific Boolean models, identifying personalized treatment strategies
- **Hands-on 4**: Running multiscale simulations combining Boolean networks (MaBoSS) with agent-based cell modeling (PhysiBoSS/PhysiCell)
- **Optional stretch goals**: Advanced analyses including multiple mutant screening and combined drug effects

## Requirements

These analyses were developed using the CoLoMoTo toolchain and require MaBoSS (pyMaBoSS), PhysiBoSS, and optional R packages for data analysis. Two recommended ways to reproduce the environment:

### 1) Conda environment (recommended for users who prefer a native setup)

Requirements:
- Conda (Anaconda/Miniconda) installed

Create the environment with the CoLoMoTo channels and required packages:

```bash
conda create -n WCS2025 -c colomoto -c potassco -c conda-forge pymaboss notebook seaborn numpy pandas matplotlib pip
conda activate WCS2025
pip install pctk ipylab
```

Optional: Install R for data analysis (section 5.2):
```bash
conda install conda-forge::r-base
conda install conda-forge::r-essentials
```

Notes:
- On Windows, using WSL (Ubuntu) is recommended for better compatibility with scientific tooling
- The first time you run the notebook, imports may take a while as packages initialize
- `pip install ipylab` might be needed if not already installed

### 2) Docker

The CoLoMoTo Docker image packages all required tools and versions:

```bash
pip install -U colomoto-docker
colomoto-docker -V 2025-03-01 --bind .
```

This will start a container with the environment and bind the current folder so you can open the notebook from the container.

## How to run the notebook

1. Clone or download this repository and navigate to the folder

2. Activate the environment:

```bash
# if using conda environment
conda activate WCS2025
```

3. Start Jupyter:

```bash
jupyter notebook
# or use VS Code's Jupyter extension
```

4. Open `Exercise_MaBoSS_PhysiBoSS.ipynb` in VS Code or the browser

5. Run the cells from top to bottom. The notebook uses MaBoSS and loads models from `./models/`

### Tips and notes:

- The first time you run the notebook, imports may take a while while packages initialize
- If a plotting cell does not render in VS Code, try running the notebook in the browser via `jupyter notebook`
- For Hands-on 3 and 4, you need to clone two external repositories and integrate local configuration files. A helpfulsetup_repos.sh files has been provided

```bash
./setup_repos.sh
```
This script will:
1. Clone https://github.com/ArnauMontagud/PROFILE_v2.git
2. Copy and overwrite files from `additional_files/PROFILE_v2/`
3. Clone https://github.com/PhysiBoSS/PhysiBoSS.git
4. Copy and overwrite files from `additional_files/PhysiBoSS/`

## Models included

- **Montagud2022_Prostate_Cancer.bnd/cfg**: The main wild-type prostate cancer Boolean network model. Used throughout the practical for simulating different phenotypes and drug responses. Source: Montagud et al. (2022), eLife 11:e72626

- **Cell-line-specific models** (in `models/cell_lines/`): Patient-specific and cancer cell-line-specific versions including:
  - VCaP, LNCaP, DU145, 22RV1, PC3, PWR1E, BPH1 (benign), WT (wild-type or non personalised), NCI-H660

## License

This repository is released under the BSD 3-Clause License. See `LICENSE` for details.

## Contact / support

If you find issues, have questions, or need help, please contact the course instructor or open an issue in the repository.

---

**Last updated**: December 4, 2025
