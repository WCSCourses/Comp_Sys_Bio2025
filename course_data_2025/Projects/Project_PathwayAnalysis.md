## Project: Human prostate cancer cells treated with different anti-cancer drugs

**What we have:**
- Human LNCaP prostate cancer cells
- 3 different drugs: Bicalutamide, Enzalutamide, and Apalutamide
- Each drug tested with and without DHT (a hormone that feeds cancer growth)
- 16 samples total with biological duplicates (n=2 per condition)
- RNA-seq data showing which genes are active in each condition

**The biological question:**
All three drugs target the androgen receptor (the protein that helps prostate cancer grow), but do they work in exactly the same way? By comparing their effects on gene expression, we can see if they activate different cellular pathways.

**Proposed analysis plan:**
- Differential expression analysis: Find which genes change with each drug treatment
- Pathway enrichment: Identify which biological processes (like cell death, metabolism, or DNA repair) are affected by each drug
- Network visualization: Use Cytoscape to map out how genes and pathways connect, highlighting differences between the three drugs
- Drug target extension: Use CyTargetLinker to find other drugs that could work together with these treatments
- ...

**Expected outcome:**
We'll discover whether these three drugs work through similar or different mechanisms. This could explain why some patients respond better to one drug than another, and help identify drug combinations that might work better together.
