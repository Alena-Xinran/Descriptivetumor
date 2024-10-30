# DescriptiveTumor

## All Checkpoints Link
https://drive.google.com/drive/folders/1v0TyqVyXjoALSFaTt4l3u4eh0k4jO_V5?usp=drive_link

## Steps
### 1. Replace Files
Replace the following files in the Difftumor/STEP3.SegmentationModel directory:

main.py

monai_trainer.py

TumorGeneration/utils.py

hg.sh

cross_eval folder

### 2. Update Data Path
Modify the data path in hg.sh to point to your dataset.
### 3. Train Specific Fold
Set fold=0 to train a specific fold.
### 4. Return Checkpoints
Three checkpoints will be generated:
difftumor-liver
difftumor-pancreas
difftumor-kidney
### 5. Future Checkpoint Updates
Subsequent checkpoints will use the following names:
descriptivetumor1 for liver, pancreas, kidney
descriptivetumor2 for liver, pancreas, kidney
descriptivetumor3 for liver, pancreas, kidney
Train across 5 folds and return the checkpoints sequentially.
