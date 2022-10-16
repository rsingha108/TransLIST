#!/bin/bash

PATH_TO_FASTNLP="$1"
st='sighum-shr'

cd sktWS
cp SIGHUM/* .
cd ..

sed -i '310 s/^setting =.*/setting = $(st)/' '$PATH_TO_FASTNLP/core/dataset.py'

cp SIGHUM_embeds/* .

cd V0


