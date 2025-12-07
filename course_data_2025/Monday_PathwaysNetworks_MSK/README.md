# Pathway and Network Analysis

**Instructor**: Martina Summer-Kutmon (martina.kutmon@maastrichtuniversity.nl)

### Overview
In this practical session, we will perform pathway and basic network analysis to explore gene expression changes in Small Cell Lung Cancer.

**Session Format**: This will be an interactive session with short lectures/introductions and short discussions between modules. 

---

### Technical Setup

**Docker Environment**

A Docker image has been prepared containing:

- RStudio
- All required R packages
- Analysis scripts and dataset

You can install the docker image by opening the Terminal on the VM and running the following two lines (the first one will take 1-2 minutes):

```
sudo docker pull mkutmon/wcs-course-2025:pathway-analysis-docker
```

```
sudo docker run --rm -p 8787:8787 -e PASSWORD=WCS2025 --network="host" mkutmon/wcs-course-2025:pathway-analysis-docker
```

You can then open the Chrome browser and type "localhost:8787" in the URL to open RStudio. 

To login, use:
- username: rstudio
- password: WCS2025

**Visualization Software**

Cytoscape is pre-installed on the VMs for pathway and network visualization and analysis.

---

### Analysis Scripts
The following R Markdown scripts are included in the Docker image and this folder:
- Module1-WhatChanged.Rmd - Explore the dataset
- Module2-WhatPathways.Rmd - Identify altered pathways
- Module3-Visualization.Rmd - Investigate and visualize pathway-level changes
- Optional-Extensions.Rmd - Network hub node identification and drug extension analysis

---

### Recommended Approach
While I also provide step-by-step instructions for the Cytoscape user interface below, I strongly recommend trying to use the R code for the following reasons:
- Reproducibility - Your analysis can be easily repeated and verified
- Efficiency - Faster execution compared to manual GUI operations
- Scalability - Simple to apply the same workflow to different datasets

---

### Running the scripts on your own computer

- You'll need to install the latest versions of R and Rstudio. See instructions here: https://posit.co/download/rstudio-desktop/. 
- Before you can run the script you need to install several R-packages: rstudioapi, readxl, EnhancedVolcano, org.Hs.eg.db, enrichplot, ggplot2, clusterProfiler, RCy3, RColorBrewer
- Also make sure that you have the latest version of Cytoscape installed!
