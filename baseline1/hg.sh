#!/bin/bash
#SBATCH --job-name=segmentation_model

#SBATCH -N 1
#SBATCH -n 8
#SBATCH -G a100:1
##SBATCH --exclusive
#SBATCH --mem=80G
#SBATCH -p general
#SBATCH -t 1-00:00:00
#SBATCH -q public

#SBATCH -o %x_slurm_%j.out     
#SBATCH -e %xslurm_%j.err      
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=zzhou82@asu.edu

healthy_datapath=/ccvl/net/ccvl15/zzhou82/data/AbdomenAtlas/image_mask/AbdomenAtlas1.1Mini/AbdomenAtlas1.1Mini/
datapath=/ccvl/net/ccvl15/xinran/
cache_rate=1.0
batch_size=4
val_every=50
workers=1
organ=liver
# organ=pancreas
# organ=kidney
fold=0

# U-Net
backbone=unet
logdir="runs/$organ.fold$fold.$backbone"
datafold_dir=cross_eval/"$organ"_aug_data_fold/
dist=$((RANDOM % 99999 + 10000))
python -W ignore main2.py --model_name $backbone --cache_rate $cache_rate --dist-url=tcp://127.0.0.1:12445 --workers $workers --max_epochs 2000 --val_every $val_every --batch_size=$batch_size --save_checkpoint --distributed --noamp --organ_type $organ --organ_model $organ --tumor_type tumor --fold $fold --ddim_ts 50 --logdir=$logdir --healthy_data_root $healthy_datapath --data_root $datapath --datafold_dir $datafold_dir

# for fold in 0; do for backbone in unet nnunet swinunetr; do for organ in liver; do sbatch --error=logs/$organ.backbone.$backbone.fold$fold.out --output=logs/$organ.backbone.$backbone.fold$fold.out hg.sh backbone organ fold; done; done; done
