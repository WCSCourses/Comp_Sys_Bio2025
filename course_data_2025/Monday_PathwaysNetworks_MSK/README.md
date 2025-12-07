# Pathway and Network Analysis

**Instructor**: Martina Summer-Kutmon (martina.kutmon@maastrichtuniversity.nl)

### Overview
In this practical session, we will perform pathway and basic network analysis to explore gene expression changes in senescent cells.

**Session Format**: This will be an interactive session with short lectures/introductions and short discussions between modules. 

---

### Technical Setup

**Docker Environment**

A Docker image has been prepared containing:

- RStudio
- All required R packages
- Analysis scripts and dataset

**Visualization Software**

Cytoscape is pre-installed on the VMs for pathway and network visualization and analysis.

---

### Analysis Scripts
The following R Markdown scripts are included in the Docker image and this folder:
- Senescence-Module1-WhatChanged.Rmd - Explore the dataset
- Senescence-Module2-WhatPathways.Rmd - Identify altered pathways
- Senescence-Module3-SeeIt.Rmd - Investigate and visualize pathway-level changes
- Senescence-Extensions-Optional.Rmd - Network hub node identification and drug extension analysis

---

### Recommended Approach
While I also provide step-by-step instructions for the Cytoscape user interface below, I strongly recommend trying to use the R code for the following reasons:
- Reproducibility - Your analysis can be easily repeated and verified
- Efficiency - Faster execution compared to manual GUI operations
- Scalability - Simple to apply the same workflow to different datasets
