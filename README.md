# Step 1: Download Datasets for Descriptivetumor Baseline
```bash
cd Descriptivetumor/baseline1/
```bash
```bash
wget https://huggingface.co/datasets/qicq1c/Pubilcdataset/resolve/main/10_Decathlon/Task03_Liver.tar.gz?download=true # Task03_Liver.tar.gz (28.7 GB)
wget https://huggingface.co/datasets/qicq1c/Pubilcdataset/resolve/main/10_Decathlon/Task07_Pancreas.tar.gz?download=true # Task07_Pancreas.tar.gz (28.7 GB)
wget https://huggingface.co/datasets/qicq1c/Pubilcdataset/resolve/main/05_KiTS.tar.gz # KiTS.tar.gz (28 GB)
```bash
# Step 2: Prepare Model Weights for Tumor Generation
```bash
cd TumorGeneration/model_weight/

wget https://huggingface.co/MrGiovanni/DiffTumor/resolve/main/AutoencoderModel/AutoencoderModel.ckpt
```bash
Add the following files from Google Drive to TumorGeneration/model_weight/
https://drive.google.com/drive/folders/1bpZMvAj9Wj8WSPnV9EJAs9gJYSE1mad6

# Step 3: Modify Paths in hg.sh File in Baseline1
Set healthy_datapath to the directory containing AbdomenAtlas1.1Mini
```bash
healthy_datapath=/ccvl/net/ccvl15/zzhou82/data/AbdomenAtlas/image_mask/AbdomenAtlas1.1Mini/AbdomenAtlas1.1Mini/
```bash
Set datapath to the root directory where Task03_Liver, Task07_Pancreas, and KiTS.tar.gz are downloaded
```bash
datapath=/ccvl/net/ccvl15/xinran/
```bash
