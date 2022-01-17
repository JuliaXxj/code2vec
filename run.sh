#!/usr/bin/env bash

home_dir=/scratch/xuxiaoj3/code2vec

dataset_name=java14m
data_dir=${home_dir}/data/${dataset_name}
data=${data_dir}/${dataset_name}
test_data=${data_dir}/${dataset_name}.test.c2v

model_dir=${home_dir}/models/java14_model
trained_model=${model_dir}/saved_model_iter8.release

source ../pyvenv/venv/bin/activate

python3 code2vec.py --load ${trained_model} --test ${test_data}
