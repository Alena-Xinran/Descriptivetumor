# Text-Driven Tumor Synthesis
Tumor synthesis can generate examples that AI often misses or over-detects, improving AI performance by training on these challenging cases. However, existing synthesis methods, which are typically unconditional---generating images from random variables---or conditioned only by tumor shapes, lack controllability over specific tumor characteristics such as texture, heterogeneity, boundaries, and pathology type. As a result, the generated tumors may be overly similar or duplicates of existing training data, failing to effectively address AI's weaknesses. We propose a new text-driven tumor synthesis approach, termed **TextoMorph**, that provides textual control over tumor characteristics.
<div align="center">
  <img src="https://github.com/user-attachments/assets/b10d59ee-78ca-443f-9d5a-862d0235a5c7" alt="fig_cloudplot" width="600"/>
</div>

[Xinran Li](https://scholar.google.com/citations?hl=zh-CN&user=awRZX_gAAAAJ), Yi Shuai, Chen Liu, Qi Chen, Qilong Wu, Pengfei Gao, Dong Yang,
Can Zhao, Pedro R. A. S. Bassi, Daguang Xu, Kang Wang, Yang Yang, [Alan Yuille](https://www.cs.jhu.edu/~ayuille/), [Zongwei Zhou](https://www.zongweiz.com/)* <br/>

**We have documented common questions for the paper in [Frequently Asked Questions (FAQ)](documents/FAQ.md).**

**We have summarized publications related to tumor synthesis in [Awesome Synthetic Tumors](https://github.com/MrGiovanni/SyntheticTumors/blob/main/AWESOME.md) [![Awesome](https://awesome.re/badge.svg)](https://awesome.re).**

**We have released videos for [Visual Turing Test](https://www.dropbox.com/scl/fo/mgw953fdysvto2y6bog1c/h?rlkey=pqe9ar4xzo52ggm5v8v43275v&dl=0).** Check to see if you could tell which is real tumor and which is synthetic tumor. 

## STEP 0. Installation

```bash
git clone https://github.com/Alena-Xinran/Descriptivetumor.git
cd Descriptivetumor
```

## STEP 1. Create a virtual environment 

```bash
conda create -n TextoMorph python=3.8
source activate TextoMorph # or conda activate TextoMorph
pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113
pip install -r requirements.txt
```
## STEP 2. Download Datasets
### Download unhealthy data
```bash
wget https://huggingface.co/datasets/qicq1c/Pubilcdataset/resolve/main/10_Decathlon/Task03_Liver.tar.gz # Task03_Liver.tar.gz (28.7 GB)
wget https://huggingface.co/datasets/qicq1c/Pubilcdataset/resolve/main/10_Decathlon/Task07_Pancreas.tar.gz # Task07_Pancreas.tar.gz (28.7 GB)
wget https://huggingface.co/datasets/qicq1c/Pubilcdataset/resolve/main/05_KiTS.tar.gz # KiTS.tar.gz (28 GB)
```
```bash
tar -zxvf Task03_Liver.tar.gz
tar -zxvf Task07_Pancreas.tar.gz
tar -zxvf 05_KiTS.tar.gz
```
### Download healthy data

```bash
huggingface-cli BodyMaps/_AbdomenAtlas1.1Mini --token paste_your_token_here --repo-type dataset --local-dir .
bash unzip.sh
bash delete.sh

huggingface-cli download qicq1c/HealthyCT  --repo-type dataset --local-dir .  --cache-dir ./cache
cat healthy_ct.zip* > HealthyCT.zip
rm -rf healthy_ct.zip* cache
unzip -o -q HealthyCT.zip -d /HealthyCT
```
## STEP 3. Train Diffusion model

## STEP 4. Train Segmentation model

```bash
cd STEP3.SegmentationModel/TumorGeneration/model_weight
wget https://huggingface.co/MrGiovanni/DiffTumor/resolve/main/AutoencoderModel/AutoencoderModel.ckpt
cd ..
cd model_weight/
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor2/liver.pt
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor2/pancreas.pt
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor2/kidney.pt
cd ../..

```
