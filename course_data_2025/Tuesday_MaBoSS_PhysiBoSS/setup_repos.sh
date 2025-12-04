#!/bin/bash

# Script to clone PROFILE_v2 and PhysiBoSS, and overwrite with local files

# Clone PROFILE_v2
echo "Cloning PROFILE_v2 repository..."
git clone https://github.com/ArnauMontagud/PROFILE_v2.git

# Copy files from additional_files/PROFILE_v2 to the cloned folder
echo "Copying local PROFILE_v2 files to cloned repository..."
cp -r additional_files/PROFILE_v2/* PROFILE_v2/

# Clone PhysiBoSS
echo "Cloning PhysiBoSS repository..."
git clone https://github.com/PhysiBoSS/PhysiBoSS.git

# Copy files from additional_files/PhysiBoSS to the cloned folder
echo "Copying local PhysiBoSS files to cloned repository..."
cp -r additional_files/PhysiBoSS/* PhysiBoSS/

echo "Setup complete!"
