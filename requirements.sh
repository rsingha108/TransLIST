#!/bin/bash

PATH_TO_ENVS="$1"

conda env create -f tlat0.yml

conda activate tlat0

cp fastnlp-copy/core/tester.py $PATH_TO_ENVS/tlat0/lib/python3.7/site-packages/fastNLP/core/

cp fastnlp-copy/core/dataset.py $PATH_TO_ENVS/tlat0/lib/python3.7/site-packages/fastNLP/core/

cp fastnlp-copy/core/metric.py $PATH_TO_ENVS/tlat0/lib/python3.7/site-packages/fastNLP/core/

cp fastnlp-copy/modules/decoder/crf.py $PATH_TO_ENVS/tlat0/lib/python3.7/site-packages/fastNLP/modules/decoder/


