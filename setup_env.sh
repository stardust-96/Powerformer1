#!/bin/bash
set -e

echo "=== Creating Conda Environment: powerformer_env ==="
conda create -y -n powerformer_env python=3.10

echo "=== Activating Environment ==="
source /HPC/muhammad.jawadbashir/anaconda3/etc/profile.d/conda.sh
conda activate powerformer_env

echo "=== Installing Requirements ==="
cd $SLURM_SUBMIT_DIR/Powerformer
pip install -r requirements.txt

echo "=== Environment Setup Complete ==="
echo "You can now run your SLURM jobs using this environment."
