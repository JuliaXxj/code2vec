#!/usr/bin/env bash
#SBATCH --time=40:00:00
#SBATCH --account=def-six
#SBATCH --gres=gpu:a100:1
#SBATCH --mem=16G
#SBATCH --job-name=firsttrain
###########################################################
# Change the following values to train a new model.
# type: the name of the new model, only affects the saved file name.
# dataset: the name of the dataset, as was preprocessed using preprocess.sh
# test_data: by default, points to the validation set, since this is the set that
#   will be evaluated after each training iteration. If you wish to test
#   on the final (held-out) test set, change 'val' to 'test'.

home_dir=/scratch/xuxiaoj3/code2vec

type=java14m
dataset_name=java14m
data_dir=${home_dir}/data/${dataset_name}
data=${data_dir}/${dataset_name}
test_data=${data_dir}/${dataset_name}.val.c2v
model_dir=models/${type}

source ../pyvenv/venv/bin/activate

mkdir -p ${model_dir}
set -e
python3 -u code2vec.py --data ${data} --test ${test_data} --save ${model_dir}/saved_model
