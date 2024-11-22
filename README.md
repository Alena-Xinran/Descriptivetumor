## STEP 1. Create a virtual environment 

```bash
conda create -n TextoMorph python=3.8
source activate TextoMorph # or conda activate TextoMorph
pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113
pip install -r requirements.txt
```
## STEP 2. Download Datasets
download unhealthy data
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
download healthy data

```bash
huggingface-cli BodyMaps/_AbdomenAtlas1.1Mini --token paste_your_token_here --repo-type dataset --local-dir .
bash unzip.sh
bash delete.sh
```

## STEP 3. train
```bash
sh hg.sh
```
