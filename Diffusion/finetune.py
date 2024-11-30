import sys
import os
os.environ["CUDA_VISIBLE_DEVICES"] = "3"
sys.path.insert(0, '/ccvl/net/ccvl15/xinran/ReportTumor/STEP2.DiffusionModel2')

import hydra
from omegaconf import DictConfig, OmegaConf, open_dict
import torch
from ddpm import Unet3D, GaussianDiffusion, Trainer

from dataset.dataloader import get_loader

@hydra.main(config_path='config', config_name='base_cfg', version_base=None)
def run(cfg: DictConfig):

    torch.cuda.set_device(cfg.model.gpus)

    with open_dict(cfg):
        cfg.model.results_folder = os.path.join(
            cfg.model.results_folder, cfg.dataset.name, cfg.model.results_folder_postfix
        )

    # 初始化模型
    if cfg.model.denoising_fn == 'Unet3D':
        model = Unet3D(
            dim=cfg.model.diffusion_img_size,
            dim_mults=cfg.model.dim_mults,
            channels=cfg.model.diffusion_num_channels,
            out_dim=cfg.model.out_dim
        ).cuda()
    else:
        raise ValueError(f"Model {cfg.model.denoising_fn} doesn't exist")

    diffusion = GaussianDiffusion(
        model,
        vqgan_ckpt=cfg.model.vqgan_ckpt,
        image_size=cfg.model.diffusion_img_size,
        num_frames=cfg.model.diffusion_depth_size,
        channels=cfg.model.diffusion_num_channels,
        timesteps=cfg.model.timesteps,
        loss_type=cfg.model.loss_type,
    ).cuda()

    train_dataloader, train_sampler, dataset_size = get_loader(cfg.dataset)

    trainer = Trainer(
        diffusion,
        cfg=cfg,
        dataset=train_dataloader,
        train_batch_size=cfg.model.batch_size,
        save_and_sample_every=cfg.model.save_and_sample_every,
        train_lr=cfg.model.finetune_lr,  # 使用微调的学习率
        train_num_steps=cfg.model.train_num_steps,
        gradient_accumulate_every=cfg.model.gradient_accumulate_every,
        ema_decay=cfg.model.ema_decay,
        amp=cfg.model.amp,
        num_sample_rows=cfg.model.num_sample_rows,
        results_folder=cfg.model.results_folder,
        num_workers=cfg.model.num_workers,
    )

    checkpoint_path = '/Diffusion/checkpoints/ddpm/pancreas_tumor_train/pancreas_early_tumor_fold0/pancreas.pt'
    if os.path.exists(checkpoint_path):
        checkpoint = torch.load(checkpoint_path)
        model.load_state_dict(checkpoint['model'])
        if 'step' in checkpoint:
            trainer.step = checkpoint['step']
        print(f"ok：{checkpoint_path}")
    else:
        raise FileNotFoundError(f"no：{checkpoint_path}")

    trainer.train()

if __name__ == '__main__':
    run()
