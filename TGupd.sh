#!/bin/bash
#SBATCH --job-name=Powerformer_Weather
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=4
#SBATCH --time=48:00:00
#SBATCH --output=logs/powerformer_weather_%j.out
#SBATCH --error=logs/powerformer_weather_%j.err
#SBATCH --export=ALL

set -e

echo "=== Powerformer job started on $(date) ==="
echo "=== Hostname ==="
hostname

source /etc/profile

module purge
module load slurm/slurm/23.11.11
module load gcc/14.1.0
module load cuda13.1/toolkit/13.1.1

echo "=== Modules Loaded ==="
module list

source /HPC/muhammad.jawadbashir/anaconda3/etc/profile.d/conda.sh
conda activate powerformer_env

echo "=== Current Conda Environment ==="
echo "$CONDA_DEFAULT_ENV"

echo "=== Python Location & Version ==="
which python
python --version

echo "=== Checking GPU with nvidia-smi ==="
nvidia-smi

cd $SLURM_SUBMIT_DIR/Powerformer

export PYTHONUNBUFFERED=1
echo "=== Starting Powerformer Training ==="

sh ./scripts/Powerformer/weather.sh

echo "=== Powerformer training finished at $(date) ==="