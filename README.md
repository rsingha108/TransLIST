# TransLIST : A Transformer-Based Linguistically Informed Sanskrit Tokenizer

Link to paper : [need to provide link]

## Requirements :

* Python 3.7.3
* Pytorch 1.5.0
* CUDA 10.2

Run bash ```bash requirements.sh [PATH to your conda environments]``` (e.g. ~/anaconda3/envs)

Or do it manually :

* Create an environment using the tlat0.yml file given in the root directory.
  * conda env create -f tlat0.yml
  * conda activate tlat0

Replace the files 'tester.py', 'dataset.py', 'metrics.py' and 'crf.py' as per the files given in "fastnlp-copy" directory inside the root directory.

* Paths : 
  * tlat0/lib/python3.7/site-packages/fastNLP/core --> 'tester.py', 'dataset.py', 'metric.py'
  * tlat0/lib/python3.7/site-packages/fastNLP/modules/decoder --> 'crf.py'
  
 

## Datasets

We have used two datasets : 

1. SIGHUM
2. Hackathon

## Setup

Link to some required files (large) : https://drive.google.com/drive/folders/1SCU_MwzePYai0ymAE3B5xuC8JhBZlxMd?usp=sharing

Download zip files from the above link and keep them in root directory, then...

Run ```bash setup.sh``` or do it manually...

1. **SIGHUM_GraphMLs.zip** : unzip and get 'skt' folder, keep in root directory.
2. **SIGHUM_Ngram_Lattices.zip** : unzip and get 'ngram_lattice_files' folder, keep in root directory.
3. **SIGHUM_SHR_Lattices.zip** : unzip and get 'lattice_files' folder, keep in root directory.
4. **SIGHUM_embeds.zip** : unzip and get 'SIGHUM_embeds' folder, keep in root directory.
5. **Hack_Lattices.zip** : unzip and get 'hack_ngram_lattice_files' & 'hack_shr_lattice_files' folders, keep both in root directory.
6. **Hackathon_data.zip** : unzip and get 'embeds', 'final_graphml_dev', 'final_graphml_test', 'final_graphml_train' folders, keep them inside "root/Hackathon_data" directory.
7. **sktWS.zip** : unzip and get 'sktWS' folder, keep in root directory.
8. **saved_models.zip** : unzip and get 4 models (best_sighum_shr2, best_sighum_ngram2, best_hack_shr2, best_hack_ngram2) and keep inside "root/V0/saved_models" directory.

## How to train Models?

We have 2 types of models - (1) SHR Model (2) Ngram Model
and we have two datasets - (1) SIGHUM (2) Hackathon

So, total 4 settings...


1. Training "SIGHUM Translist Ngram" : 
	
	Run ```bash train_sighum_ngram.sh [PATH to your conda environments]``` or do manually...
	- In sktWS place SIGHUM data ( from root/sktWS dir run : ```cp SIGHUM/* .``` )
	- tlat0/.../fastNLP/core/dataset.py : line 310 : ```setting = "sighum-ngram"```
	- use the embeds in the SIGHUM_embeds folder. (from root dir run : ```cp SIGHUM_embeds/* .```)
	
	Then run :
	- from V0 directory run : ```python flat_main_bigram.py --status train --batch 4``` (in a tmux session)
	- rename saved model in V0/saved_model

2. Training "SIGHUM Translist SHR"
	
	Run ```bash train_sighum_shr.sh [PATH to your conda environments]``` or do manually...
	- In sktWS place SIGHUM data ( from root/sktWS dir run : ```cp SIGHUM/* .``` )
	- tlat0/.../fastNLP/core/dataset.py : line 310 : ```setting = "sighum-shr"```
	- use the embeds in the SIGHUM_embeds folder. (from root dir run : ```cp SIGHUM_embeds/* .```)
	
	Then run:
	- from V0 directory run : ```python flat_main_bigram.py --status train --batch 8``` (in a tmux session)
	- rename saved model in V0/saved_model
	
3. Training "Hackathon Translist Ngram"
	
	Run ```bash train_hack_ngram.sh [PATH to your conda environments]``` or do manually...
	- In sktWS place Hackathon data ( from root/sktWS dir run : ```cp hackathon/* .``` )
	- tlat0/.../fastNLP/core/dataset.py : line 310 : ```setting = "hack-ngram"```
	- use the embeds in the Hackathon_data/embeds folder. (from root dir run : ```cp Hackathon_data/embeds/* .```)
	
	Then run:
	- from V0 directory run : ```python flat_main_bigram.py --status train --batch 4``` (in a tmux session)
	- rename saved model in V0/saved_model

4. Training "Hackathon Translist SHR"
	
	Run ```bash train_hack_shr.sh [PATH to your conda environments]``` or do manually...
	- In sktWS place Hackathon data ( from root/sktWS dir run : ```cp hackathon/* .``` )
	- tlat0/.../fastNLP/core/dataset.py : line 310 : ```setting = "hack-shr"```
	- use the embeds in the Hackathon_data/embeds folder. (from root dir run : ```cp Hackathon_data/embeds/* .```)
	
	Then run:
	- from V0 directory run : ```python flat_main_bigram.py --status train --batch 8``` (in a tmux session)
	- rename saved model in V0/saved_model

    
## Inference 

1. Testing "SIGHUM Translist Ngram" :
	
	- from V0 run ```python flat_main_bigram.py --status test --test_model best_sighum_ngram2```
	- don't run CI (not applicable in this case)
    
2. Testing "SIGHUM Translist SHR" :
	
	- from V0 run ```python flat_main_bigram.py --status test --test_model best_sighum_shr2```
	- run CI : ```python constrained_inference.py --dataset sighum```

3. Testing "Hackathon Translist Ngram" :
	
	- from V0 run ```python flat_main_bigram.py --status test --test_model best_hack_ngram2```
	- don't run CI (not applicable in this case)
    
4. Testing "Hackathon Translist SHR" :
	
	- from V0 run ```python flat_main_bigram.py --status test --test_model best_hack_shr2```
	- run CI : ```python constrained_inference.py --dataset hackathon``` 

		
## Interactive Mode 

In interactive mode, user can provide any sentence and on the fly the graphml will be generated by scraping the SHR and it will be converted to lattice, and a pretrained model "best_sighum_shr2" will give its prediction on the sentence and Constrained Inference will be applied and it will output segmented sentence.

From root/V0 run ```python interactive_module.py --sentence="[YOUR SENTENCE HERE]"``` (Sentence expected to be in SLP format)

** You may require to change the urlname (root/V0/create_graphml/create_graphml.py line 116) so that it can connect with online SHR (Sanskrit Heritage Reader).

Example : 
```
python interactive_module.py --sentence="ahaM sOBapateH senAm AyasEr BujagEr iva"

Output : 

inp_data_i :  ['ahaM', 'sOBapateH', 'senAm', 'AyasEr', 'BujagEr', 'iva']

Model prediction :  ['aham', 'sOBa_pateH', 'senAm', 'AyasEH', 'BujagEH', 'iva']

Final Segmentation :  aham sOBa pateH senAm AyasEH BujagEH iva
```



## Citation

## License

## Acknowledgements
