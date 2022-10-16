#!/bin/bash

PATH_TO_FASTNLP="$1"
st='hack-ngram'

cd sktWS
cp hackathon/* .
cd ..

sed -i '310 s/^setting =.*/setting = $(st)/' '$PATH_TO_FASTNLP/core/dataset.py'

cp Hackathon_data/embeds/* .

cd V0


