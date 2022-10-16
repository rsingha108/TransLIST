#!/bin/bash

PATH_TO_FASTNLP="$1"

conda env create -f tlat0.yml

conda activate tlat0

cp fastnlp-copy/core/tester.py $PATH_TO_FASTNLP/core/

cp fastnlp-copy/core/dataset.py $PATH_TO_FASTNLP/core/

cp fastnlp-copy/core/metric.py $PATH_TO_FASTNLP/core/

cp fastnlp-copy/modules/decoder/crf.py $PATH_TO_FASTNLP/modules/decoder/


