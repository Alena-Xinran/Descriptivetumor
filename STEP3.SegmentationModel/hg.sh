export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True

healthy_datapath=/ccvl/net/ccvl15/xinran/
datapath=/ccvl/net/ccvl15/xinran/
cache_rate=1.0
batch_size=1
val_every=1
workers=0
organ=liver
fold=0

# U-Net
backbone=unet
logdir="runs/$organ.fold$fold.$backbone"
datafold_dir=cross_eval/"$organ"_aug_data_fold/
dist=$((RANDOM % 99999 + 10000))
python -W ignore main.py --model_name $backbone --cache_rate $cache_rate --dist-url=tcp://127.0.0.1:12565 --workers $workers --max_epochs 2000 --val_every $val_every --batch_size=$batch_size --save_checkpoint --distributed --noamp --organ_type $organ --organ_model $organ --tumor_type tumor --fold $fold --ddim_ts 50 --logdir=$logdir --healthy_data_root $healthy_datapath --data_root $datapath --datafold_dir $datafold_dir

# # nnU-Net
# backbone=nnunet
# logdir="runs/$organ.fold$fold.$backbone"
# datafold_dir=cross_eval/"$organ"_aug_data_fold/
# dist=$((RANDOM % 99999 + 10000))
# python -W ignore main.py --model_name $backbone --cache_rate $cache_rate --dist-url=tcp://127.0.0.1:$dist --workers $workers --max_epochs 2000 --val_every $val_every --batch_size=$batch_size --save_checkpoint --distributed --noamp --organ_type $organ --organ_model $organ --tumor_type tumor --fold $fold --ddim_ts 50 --logdir=$logdir --healthy_data_root $healthy_datapath --data_root $datapath --datafold_dir $datafold_dir

# # Swin-UNETR
# backbone=swinunetr
# logdir="runs/$organ.fold$fold.$backbone"
# datafold_dir=cross_eval/"$organ"_aug_data_fold/
# dist=$((RANDOM % 99999 + 10000))
# python -W ignore main.py --model_name $backbone --cache_rate $cache_rate --dist-url=tcp://127.0.0.1:$dist --workers $workers --max_epochs 2000 --val_every $val_every --batch_size=$batch_size --save_checkpoint --distributed --noamp --organ_type $organ --organ_model $organ --tumor_type tumor --fold $fold --ddim_ts 50 --logdir=$logdir --healthy_data_root $healthy_datapath --data_root $datapath --datafold_dir $datafold_dir