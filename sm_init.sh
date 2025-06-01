#!/bin/bash
source /root/miniconda3/etc/profile.d/conda.sh
conda create -n sm python=3.10 -y
conda activate sm
conda install -y pytorch==2.2.0 torchvision==0.17.0 pytorch-cuda=11.8 -c pytorch -c nvidia
conda install -y -c conda-forge tensorboard
pip install -r /root/requirements.txt
pip install flash-attn==2.5.8 --no-build-isolation
pip install -U 'huggingface_hub[cli]'
pip install ego4d
