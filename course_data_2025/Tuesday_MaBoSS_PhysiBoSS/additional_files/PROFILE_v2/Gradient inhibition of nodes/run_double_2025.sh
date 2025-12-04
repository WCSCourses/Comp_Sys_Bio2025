#!/bin/bash

# running script
# run first the WTs
if [ ! -d "WT_sims" ] || [ ! -f "WT_sims/LNCAP_mutRNA_EGF.bnd" ] || [ ! -f "WT_sims/LNCAP_mutRNA_EGF.cfg" ]; then
    mkdir -p WT_sims
    echo Creating the WT_sims folder
    cp -r LNCAP_mutRNA_EGF* ./WT_sims/
fi
cd WT_sims
echo Running the WT model
../MBSS_FormatTable.pl LNCAP_mutRNA_EGF.bnd LNCAP_mutRNA_EGF.cfg 
cd ..

python ./PROFILE_DrugSim.py LNCAP_mutRNA_EGF -d "HSPs, PI3K" -c "0, 0.2, 0.4, 0.6, 0.8, 1"
