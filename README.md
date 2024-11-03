# Baseline 1
## Step 1: Download Datasets for Descriptivetumor Baseline
```bash
git clone https://github.com/Alena-Xinran/Descriptivetumor.git

cd Descriptivetumor/baseline1/
```
```bash
wget https://huggingface.co/datasets/qicq1c/Pubilcdataset/resolve/main/10_Decathlon/Task03_Liver.tar.gz?download=true # Task03_Liver.tar.gz (28.7 GB)
wget https://huggingface.co/datasets/qicq1c/Pubilcdataset/resolve/main/10_Decathlon/Task07_Pancreas.tar.gz?download=true # Task07_Pancreas.tar.gz (28.7 GB)
wget https://huggingface.co/datasets/qicq1c/Pubilcdataset/resolve/main/05_KiTS.tar.gz # KiTS.tar.gz (28 GB)
```
## Step 2: Prepare Model Weights for Baseline 1
```bash
cd TumorGeneration/model_weight/
wget https://huggingface.co/MrGiovanni/DiffTumor/resolve/main/AutoencoderModel/AutoencoderModel.ckpt
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/difftumor/liver.pt?download=true
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/difftumor/pancreas.pt?download=true
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/difftumor/kidney.pt?download=true
```

## Step 3: Modify Paths in hg.sh File in Baseline 1
Set healthy_datapath to the directory containing AbdomenAtlas1.1Mini
```bash
healthy_datapath=/ccvl/net/ccvl15/zzhou82/data/AbdomenAtlas/image_mask/AbdomenAtlas1.1Mini/AbdomenAtlas1.1Mini/
```
Set datapath to the root directory where Task03_Liver, Task07_Pancreas, and KiTS.tar.gz are downloaded
```bash
datapath=Descriptivetumor/baseline1/
```

# Baseline 2

## Step 1: Prepare Model Weights for Baseline 2
```bash
cd Descriptivetumor/STEP3.SegmentationModel/
cd TumorGeneration/model_weight/
wget https://huggingface.co/MrGiovanni/DiffTumor/resolve/main/AutoencoderModel/AutoencoderModel.ckpt
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor/liver.pt?download=true
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor/pancreas.pt?download=true
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor/kidney.pt?download=true
```

## Step 2: Modify Paths in hg.sh File in Baseline 2
Set healthy_datapath to the directory containing AbdomenAtlas1.1Mini
```bash
healthy_datapath=/ccvl/net/ccvl15/zzhou82/data/AbdomenAtlas/image_mask/AbdomenAtlas1.1Mini/AbdomenAtlas1.1Mini/
```
Set datapath to the root directory where Task03_Liver, Task07_Pancreas, and KiTS.tar.gz are downloaded
```bash
datapath=Descriptivetumor/baseline1/
```

# Baseline 3

## Step 1: Prepare Model Weights for Baseline 3
```bash
cd Descriptivetumor/STEP3.SegmentationModel/
cd TumorGeneration/model_weight/
wget https://huggingface.co/MrGiovanni/DiffTumor/resolve/main/AutoencoderModel/AutoencoderModel.ckpt
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor2/liver.pt?download=true
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor2/pancreas.pt?download=true
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor2/kidney.pt?download=true
```

## Step 2: Modify Paths in hg.sh File in Baseline 3
Set healthy_datapath to the directory containing AbdomenAtlas1.1Mini
```bash
healthy_datapath=/ccvl/net/ccvl15/zzhou82/data/AbdomenAtlas/image_mask/AbdomenAtlas1.1Mini/AbdomenAtlas1.1Mini/
```
Set datapath to the root directory where Task03_Liver, Task07_Pancreas, and KiTS.tar.gz are downloaded
```bash
datapath=Descriptivetumor/baseline1/
```
# Baseline 4

## Step 1: Prepare Model Weights for Baseline 4
```bash
cd Descriptivetumor/STEP3.SegmentationModel/
cd TumorGeneration/model_weight/
wget https://huggingface.co/MrGiovanni/DiffTumor/resolve/main/AutoencoderModel/AutoencoderModel.ckpt
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor3/liver.pt?download=true
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor3/pancreas.pt?download=true
wget https://huggingface.co/Alena-Xinran/DescriptiveTumor/resolve/main/descriptivetumor3/kidney.pt?download=true
```

## Step 2: Modify Paths in hg.sh File in Baseline 4
Set healthy_datapath to the directory containing AbdomenAtlas1.1Mini
```bash
healthy_datapath=/ccvl/net/ccvl15/zzhou82/data/AbdomenAtlas/image_mask/AbdomenAtlas1.1Mini/AbdomenAtlas1.1Mini/
```
Set datapath to the root directory where Task03_Liver, Task07_Pancreas, and KiTS.tar.gz are downloaded
```bash
datapath=Descriptivetumor/baseline1/
```
