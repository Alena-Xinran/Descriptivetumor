# Download Datasets and environment for Descriptivetumor Baseline
## STEP 1. Create a virtual environment 

The environment is the same as [DiffTumor](https://github.com/MrGiovanni/DiffTumor)

```bash
conda create -n difftumor python=3.8
source activate difftumor # or conda activate difftumor
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
download healthy data
```bash
huggingface-cli download AbdomenAtlas/_AbdomenAtlas1.1Mini --token paste_your_token_here --repo-type dataset --local-dir .
bash unzip.sh
bash delete.sh
```
```bash
git clone https://github.com/Alena-Xinran/Descriptivetumor.git
cd Descriptivetumor/
```
# Baseline 0-baseline1
```bash
cd baseline1/
```
## Step 1: Prepare Model Weights for Baseline 0
```bash
cd TumorGeneration/model_weight/
wget https://huggingface.co/MrGiovanni/DiffTumor/resolve/main/AutoencoderModel/AutoencoderModel.ckpt
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/difftumor/liver.pt
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/difftumor/pancreas.pt
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/difftumor/kidney.pt
```

## Step 2: Modify Paths in baseline1/hg.sh File in Baseline 0
Set healthy_datapath to the directory containing AbdomenAtlas1.1Mini
```bash
healthy_datapath=/ccvl/net/ccvl15/zzhou82/data/AbdomenAtlas/image_mask/AbdomenAtlas1.1Mini/AbdomenAtlas1.1Mini/
```
Set datapath to the root directory where Task03_Liver, Task07_Pancreas, and KiTS are downloaded
```bash
datapath=....
```
Modify the organ parameter to be liver, pancreas, and kidney, respectively.
```bash
organ=kidney
#organ=liver
#organ=pancreas
```
## Step 3: Result
3 organ (liver, pancreas, and kidney)  = 3 checkpoints.

# Baseline 1-3-STEP3.SegmentationModel
```bash
cd Descriptivetumor/STEP3.SegmentationModel/
```
## Step 1: Prepare Model Weights for Baseline 1-3
```bash
cd TumorGeneration/model_weight/
wget https://huggingface.co/MrGiovanni/DiffTumor/resolve/main/AutoencoderModel/AutoencoderModel.ckpt
```

```bash
cd TumorGeneration/model_weight1/
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor/liver.pt
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor/pancreas.pt
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor/kidney.pt
```

```bash
cd TumorGeneration/model_weight2/
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor2/liver.pt
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor2/pancreas.pt
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor2/kidney.pt
```

```bash
cd TumorGeneration/model_weight3/
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor3/liver.pt
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor3/pancreas.pt
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor3/kidney.pt
```

## Step 2: Modify Paths in STEP3.SegmentationModel/hg.sh File in Baseline 1-3
Set healthy_datapath to the directory containing AbdomenAtlas1.1Mini
```bash
healthy_datapath=/ccvl/net/ccvl15/zzhou82/data/AbdomenAtlas/image_mask/AbdomenAtlas1.1Mini/AbdomenAtlas1.1Mini/
```
Set datapath to the root directory where Task03_Liver, Task07_Pancreas, and KiTS are downloaded
```bash
datapath=....
```

Modify the organ parameter to be liver, pancreas, and kidney, respectively.
```bash
organ=kidney
#organ=liver
#organ=pancreas
```

Modify the version parameter to be 1, 2, and 3, respectively.
```bash
version=1
#version=2
#version=3
```

## Step 3: Result
3 organ (liver, pancreas, and kidney) * 3 version (1,2,3) = 9 checkpoints.
